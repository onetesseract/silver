use std::collections::HashMap;

use inkwell::{context::Context, builder::Builder, passes::PassManager, values::{FunctionValue, PointerValue, BasicMetadataValueEnum, CallableValue, BasicValueEnum, BasicValue, InstructionOpcode}, module::{Module, Linkage}, types::{BasicTypeEnum, FunctionType, BasicMetadataTypeEnum, BasicType}, AddressSpace, IntPredicate};
use parser::syntax::{expr::Expr, fndef::{FnDef, FnProto}, literal::Literal, toplevel::TopLevelExpr, ty::Type, atom::Atom};

pub struct Compiler<'a, 'ctx> {
    pub context: &'ctx Context,
    pub builder: &'a Builder<'ctx>,
    pub fpm: &'a PassManager<FunctionValue<'ctx>>,
    pub module: &'a Module<'ctx>,
    // pub function: &'a (FnDef<'ctx>, Expr<'ctx>),

    variables: HashMap<String, PointerValue<'ctx>>,
    types: HashMap<String, BasicTypeEnum<'ctx>>,
    fn_val_opt: Option<FunctionValue<'ctx>>,
}

impl<'a, 'ctx> Compiler<'a, 'ctx> {
    /// Gets a defined function given a name
    fn get_function(&self, name: &str) -> Option<FunctionValue<'ctx>> {
        self.module.get_function(name)
    }

    /// Gets the function being compiled
    fn fn_value(&self) -> FunctionValue<'ctx> {
        self.fn_val_opt.unwrap()
    }

    /// Creates a stack allocation instruction in the entry block of a function (reserves space for
    /// a variable)
    fn create_entry_block_alloca(&self, name: String, ty: BasicTypeEnum<'ctx>) -> PointerValue<'ctx> {
        let builder = self.context.create_builder();

        let entry = self.fn_value().get_first_basic_block().unwrap();

        match entry.get_first_instruction() {
            Some(first) => builder.position_before(&first),
            None => builder.position_at_end(entry),
        }
        builder.build_alloca(ty, name.as_str())
    }

    fn build_call(&self, target: PointerValue<'ctx>, args: Vec<BasicValueEnum<'ctx>>) -> Result<Option<BasicValueEnum<'ctx>>, String> {
        let argsv: Vec<BasicMetadataValueEnum> = args.iter().by_ref().map(|&val| val.into()).collect();
        let call = self.builder.build_call(CallableValue::try_from(target).unwrap(), argsv.as_slice(), "tmp_call")
            .try_as_basic_value();
        if call.is_left() {
            Ok(Some(call.left().unwrap()))
        } else {
            Ok(None)
        }
    }


    fn build_assign(&self, lhs: PointerValue<'ctx>, rhs: BasicValueEnum<'ctx>) -> Result<(), String> {
        self.builder.build_store(lhs, rhs);
        Ok(())
    }

    fn build_add(&self, lhs: BasicValueEnum<'ctx>, rhs: BasicValueEnum<'ctx>) -> Result<BasicValueEnum<'ctx>, String> {
        match lhs {
            BasicValueEnum::IntValue(int_lhs) => Ok(self.builder.build_int_add(int_lhs, rhs.into_int_value(), "tmp_int_add").as_basic_value_enum()),
            _ => Err(format!("Cannot add {:?} and {:?}", lhs, rhs)),
        }
    }

    fn compile_expr_lhs(&mut self, expr: &Expr) -> Result<PointerValue<'ctx>, String> {
        match expr {
            Expr::Atom(Atom::Identifier(id)) => match self.variables.get(id.name) {
                Some (s) => Ok(*s),
                None => Err(format!("Cannot find varible {}", id.name)),
            },
            _ => match self.compile_expr(expr)? {
                Some(BasicValueEnum::PointerValue(p)) => Ok(p),
                any => Err(format!("Expected a pointer to assign or call, got {:?}", any))
            },
        }
    }


    /// Compiles the given Expr into a BasicTypeEnum
    fn compile_expr(&mut self, expr: &Expr) -> Result<Option<BasicValueEnum<'ctx>>, String> {
        match expr {
            Expr::Call(call) => {
                if call.is_infix {
                    match &*call.function {
                        Expr::Atom(Atom::Identifier(id)) => {
                            match id.name {
                                "=" => {
                                    let lhs = self.compile_expr_lhs(&call.args[0])?;
                                    // let lhs = if let Some(BasicValueEnum::PointerValue(pointer)) = lhs {
                                    //     pointer
                                    // } else {
                                    //     return Err(format!("{:?} is not a pointer yet you would assign it.", call.args[0]))
                                    // };
                                    let rhs = self.compile_expr(&call.args[1])?;
                                    let rhs = match rhs {
                                        Some(rhs) => rhs,
                                        None => return Err(format!("cannot assign void to a thing - trying to use {:?}", call.args[1])),
                                    };
                                    self.build_assign(lhs, rhs)?;
                                    return Ok(None);
                                },
                                "+" => {
                                    let lhs = match self.compile_expr(&call.args[0])? {
                                        Some(s) => s,
                                        None => return Err("Cannot add with a null value".to_string()),
                                    };
                                    let rhs = match self.compile_expr(&call.args[1])? {
                                        Some(s) => s,
                                        None => return Err("Cannot add with a null value".to_string()),
                                    };
                                    return Ok(Some(self.build_add(lhs, rhs)?));
                                },
                                "==" => {
                                    let lhs = match self.compile_expr(&call.args[0])? {
                                        Some(s) => s,
                                        None => return Err("Cannot compare with a null value".to_string()),
                                    };
                                    let rhs = match self.compile_expr(&call.args[1])? {
                                        Some(s) => s,
                                        None => return Err("Cannot compare with a null value".to_string()),
                                    };
                                    match lhs { // TODO: not just call into_x_value
                                        BasicValueEnum::IntValue(iv) => return Ok(Some(
                                                self.builder.build_int_compare(IntPredicate::EQ, iv, rhs.into_int_value(), "tmp_int_eq_cmp").as_basic_value_enum()
                                                )),
                                        _ => todo!(),
                                    };
                                },
                                "!=" => { // TODO: move this logic into its own fn
                                    let lhs = match self.compile_expr(&call.args[0])? {
                                        Some(s) => s,
                                        None => return Err("Cannot compare with a null value".to_string()),
                                    };
                                    let rhs = match self.compile_expr(&call.args[1])? {
                                        Some(s) => s,
                                        None => return Err("Cannot compare with a null value".to_string()),
                                    };
                                    match lhs { // TODO: not just call into_x_value
                                        BasicValueEnum::IntValue(iv) => return Ok(Some(
                                                self.builder.build_int_compare(IntPredicate::NE, iv, rhs.into_int_value(), "tmp_int_ne_cmp").as_basic_value_enum()
                                                )),
                                        _ => todo!(),
                                    };
                                },
                                _ => (),
                            }
                        },
                        _ => (),
                    }
                }
                let mut args = vec![];
                // if call.is_infix TODO: infix calls
                for i in &call.args {
                    args.push(match self.compile_expr(i)? {
                        Some(expr) => expr,
                        // HUGE TODO: fix else statements kekw
                        None => return Err(format!("y u wanna call with a null value as arg - {:?}", i)),
                    });
                }
                let target = self.compile_expr_lhs(&call.function)?;
                self.build_call(target, args)
            },
            Expr::Atom(atom) => match atom {
                parser::syntax::atom::Atom::Identifier(id) => {
                    println!("{:?}", self.variables.get(id.name).unwrap().get_type());
                    Ok(Some(self.builder.build_load(match self.variables.get(id.name) {
                    Some(s) => *s,
                    None => return Err(format!("Cannot find variable {}", id.name)),
                }, "tmp_variable_load")))}
                , // TODO: uhhh should this be loaded
                parser::syntax::atom::Atom::Block(block) => {
                    if block.exprs.len() == 0 { return Ok(None) }
                    let mut exprs = block.exprs.clone();
                    let last_expr = exprs.pop().unwrap();
                    for i in exprs {
                        self.compile_expr(&i)?;
                    }
                    self.compile_expr(&last_expr)
                },
                parser::syntax::atom::Atom::Literal(literal) => Ok(Some(self.compile_literal(literal))),
            },
            Expr::VarDef(vardef) => {
                let ty = self.compile_type(&vardef.ty)?;
                let var = self.create_entry_block_alloca(vardef.variable.name.to_string(), ty);
                self.variables.insert(vardef.variable.name.to_string(), var);
                Ok(Some(var.as_basic_value_enum()))
            },
            Expr::Bracketed(expr) => {
                self.compile_expr(expr)
            }
            Expr::FnDef(_) => todo!("lambdas"),
            Expr::Reference(referenced) => {
                let compiled_target = self.compile_expr(&referenced)?;
                let compiled_target = match compiled_target {
                    Some(s) => s,
                    None => return Err(format!("Cannot reference a void thing - {:?}", referenced))
                };
                let varspace = self.create_entry_block_alloca("tmp_reference_variable_storage".to_string(), compiled_target.get_type());
                self.builder.build_store(varspace, compiled_target);
                Ok(Some(varspace.as_basic_value_enum()))
            },
            Expr::Dereference(target) => {
                let target = match self.compile_expr(target)? {
                    Some(BasicValueEnum::PointerValue(p)) => p,
                    _ => return Err(format!("Cannot dereference a void or not pointer thing - {:?}", target)),
                };
                Ok(Some(self.builder.build_load(target, "tmp_deref_load")))
            },
            Expr::IfElse(ifelse) => {
                let cond = match self.compile_expr(&ifelse.condition)? {
                    Some(BasicValueEnum::IntValue(i)) => i,
                    _ => return Err(format!("Cannot use {:?} as a condition in an if/else", ifelse.condition)),
                };

                let cond = cond.const_cast(self.context.bool_type(), false);
                let fn_val = self.fn_value();

                let if_bb = self.context.append_basic_block(fn_val, "if_bb");
                let cont_bb = self.context.append_basic_block(fn_val, "ifcond_bb");
                let else_bb = if let Some(_) = &ifelse.els {
                    Some(self.context.append_basic_block(fn_val, "else_bb"))
                } else { None };

                let els_val = if let Some(else_bb) = else_bb {
                    self.builder.build_conditional_branch(cond, if_bb, else_bb);

                    self.builder.position_at_end(else_bb);
                    let els = ifelse.els.as_ref().unwrap();
                    let els_val = self.compile_expr(els)?;
                    self.builder.build_unconditional_branch(cont_bb);

                    els_val
                } else {
                    self.builder.build_conditional_branch(cond, if_bb, cont_bb);
                    None
                };

                self.builder.position_at_end(if_bb);
                let if_val = self.compile_expr(&ifelse.then)?;
                self.builder.build_unconditional_branch(cont_bb);

                self.builder.position_at_end(cont_bb);

                match (if_val, els_val) {
                    (Some(if_val), Some(els_val)) => {
                        if if_val.get_type() == els_val.get_type() {
                            let phi = self.builder.build_phi(if_val.get_type(), "tmp_if_phi");
                            phi.add_incoming(&[(&if_val, if_bb), (&els_val, else_bb.unwrap())]);
                            Ok(Some(phi.as_basic_value()))
                        } else { Ok(None) }
                    },
                    _ => Ok(None),
                }
            }
            Expr::ArrayAccess(array, index) => {
                // TODO: compile_atom
                let array = match self.compile_expr(&Expr::Atom(array.clone()))? {
                    Some(s) => s,
                    None => return Err(format!("Unable to index into a void - {:?}", array)),
                };

                let index = match self.compile_expr(&index)? {
                    Some(BasicValueEnum::IntValue(iv)) => iv,
                    _ => return Err(format!("Cannot use {:?} as an index", index)),
                };
                // TODO: vector values, pointer offsets
                match array {
                    // BasicValueEnum::ArrayValue(array) => match self.builder.build_extract_value(array, index, "tmp_array_access") {
                    //     Some(s) => Ok(Some(s)),
                    //     None => Err(format!("Index {} out of bounds of array {:?}", index, array)),
                    // },
                    // TODO: add this to LHS compilation
                    BasicValueEnum::PointerValue(pointer) => Ok(Some( self.builder.build_load(unsafe { self.builder.build_gep(pointer, &[index], "tmp_pointer_gep") }, "tmp_gep_load"))),
                    _ => Err(format!("Unable to index into a non-array thing - {:?}", array)),
                }
            },
        }
    }

    fn compile_literal(&self, literal: &Literal) -> BasicValueEnum<'ctx> {
        match literal { // TODO: infer size of thing
            Literal::Str(s) => {
                let mut values = vec![];
                for c in s.chars() {
                    values.push(self.context.i8_type().const_int(c as u64, false))
                }
                // TODO: important! stop using c stings
                values.push(self.context.i8_type().const_int('\0' as u64, false));
                let raw = self.context.i8_type().const_array(values.as_slice()).as_basic_value_enum();
                let global = self.module.add_global(raw.get_type(), None, "const_str_storage");
                global.set_constant(true);
                global.set_visibility(inkwell::GlobalVisibility::Hidden);
                global.set_initializer(&raw);
                // let cast = self.builder.build_cast(InstructionOpcode::PtrToPt, global.as_pointer_value(), self.context.i8_type().ptr_type(AddressSpace::Generic), "const_string_cast");
                let cast = global.as_pointer_value().const_cast(self.context.i8_type().ptr_type(AddressSpace::Generic)).as_basic_value_enum();
                cast
            },
            Literal::Int(i) => self.context.i64_type().const_int(*i as u64, true).as_basic_value_enum(),
            Literal::Float(f) => self.context.f64_type().const_float(*f).as_basic_value_enum(),
        }
    }

    fn compile_type(&self, ty: &Type) -> Result<BasicTypeEnum<'ctx>, String> {
        match ty {
            Type::PtrTo(target) => Ok(self.compile_type(target)?.ptr_type(AddressSpace::Generic).as_basic_type_enum()),
            Type::ArrayOf(elem, count) => Ok(self.compile_type(elem)?.array_type(*count as u32).as_basic_type_enum()),
            Type::Name(id) => match self.types.get(id.name) {
                Some(s) => Ok(*s),
                None => Err(format!("Cannot find type {}", id.name))
            },
        }
    }

    fn compile_fn_proto(&self, proto: &FnProto) -> Result<(FunctionType<'ctx>, String), String> {
        let mut args_types: Vec<BasicMetadataTypeEnum> = vec![];
        for i in &proto.args {
            args_types.push(self.compile_type(&i.ty)?.into());
        }
        let mangled = args_types.mangle();

        let void_type = self.context.void_type().fn_type(args_types.as_slice(), false);
        Ok((match &proto.return_type {
            // Some(Type {name: Variable::Identifier(Identifier { name: String::from("void"), phantom: PhantomData})}) => void_type,
            Some(ty) => {
                if let Type::Name(id) = ty {
                    if id.name == "void".to_string() {
                        void_type
                    } else {
                        self.compile_type(ty)?.fn_type(args_types.as_slice(), false)
                    }
                } else {
                    self.compile_type(ty)?.fn_type(args_types.as_slice(), false)
                }
            },
            None => self.context.void_type().fn_type(args_types.as_slice(), false),
        }, mangled))
    }

    fn compile_fn(&mut self, func: &FnDef, body: Option<&Expr>) -> Result<FunctionValue<'ctx>, String> {

        let mut proto_expr = func.proto.clone();
        if let Some(s) = &func.upon {
            proto_expr.args.insert(0, s.clone());
        }

        let (proto, mangled_name) = self.compile_fn_proto(&proto_expr)?;
        let fn_val = self.module.add_function(&(mangled_name + func.name.name), proto, Some(Linkage::External));

        // set arg names
        for (i, arg) in fn_val.get_param_iter().enumerate() {
            arg.set_name(proto_expr.args[i].variable.name); // TODO: tf does this code do
        }

        let ptr_value = fn_val.as_global_value().as_pointer_value();

        self.variables.insert(func.name.name.to_string(), ptr_value);


        let body = match body {
            Some(body) => body,
            None => return Ok(fn_val),
        };

        let entry_block = self.context.append_basic_block(fn_val, "entry");

        self.builder.position_at_end(entry_block);

        // TODO: do we need this fn field
        self.fn_val_opt = Some(fn_val);

        // build variable map
        for (i, arg) in fn_val.get_param_iter().enumerate() {
            let arg_name = proto_expr.args[i].variable.name.clone();
            let varspace = self.create_entry_block_alloca(arg_name.to_string(), arg.get_type());

            self.builder.build_store(varspace, arg);
            self.variables.insert(arg_name.to_string(), varspace);
        }

        // compile the body
        let body = self.compile_expr(body)?;

        if proto.get_return_type().is_some() {
            let body = match body {
                Some(body) => body,
                None => return Err(format!("Trying to return void from a fn decl that wants {:?}", proto.get_return_type())),
            };
            if body.get_type() != proto.get_return_type().unwrap() {
                return Err(format!("Type mismatch: trying to return {:?} from a fn decl that wants {:?}", body.get_type(), proto.get_return_type().unwrap()));
            }
            self.builder.build_return(Some(&body));
        } else {
            self.builder.build_return(None);
        }

        if fn_val.verify(true) {
            self.fpm.run_on(&fn_val);

            
            Ok(fn_val)
        } else {
            println!("AAA BAD FUNCTION");
            loop {}
            // unsafe { fn_val.delete(); }
            //
            // Err("Invalid function".to_string())
        }
    }

    fn compile_tl_expr(&mut self, expr: &TopLevelExpr) -> Result<(), String> {
        match expr {
            TopLevelExpr::Assign(lhs, rhs) => {
                match lhs {
                    Expr::VarDef(_) => todo!("global constamts"),
                    Expr::FnDef(fndef) => {
                        self.compile_fn(&fndef, Some(&rhs))?;
                        Ok(())
                    },
                    _ => return Err("this stuff isnt impl send halp".to_string()),
                }
            },
            TopLevelExpr::Expr(ex) => {
                if let Expr::FnDef(fnd) = ex {
                    self.compile_fn(&fnd, None)?;
                    Ok(())
                } else {
                    todo!("other stuff ig")
                }
            },
        }
    }
}

pub trait NameMangle {
    fn mangle(&self) -> String;
}

impl<'a> NameMangle for Vec<BasicMetadataTypeEnum<'a>> {
    fn mangle(&self) -> String {
        let mut s: String = "".to_string();
        for i in self {
            // s = s + format!("{:?}", i).as_str();
            println!("mangling {:?}", i);
        }
        s
    }
}

mod tests {
    use std::collections::HashMap;

    use inkwell::{passes::PassManager, context::Context, types::BasicTypeEnum};
    use parser::syntax::toplevel::TopLevelExpr;

    use crate::compiler::Compiler;

    #[test]
    fn big_one() {
        println!("Big test");

        let context = Context::create();
        let module = context.create_module("file_kek");
        let builder = context.create_builder();

        // Create FPM
        let fpm = PassManager::create(&module);

        fpm.add_instruction_combining_pass();
        fpm.add_reassociate_pass();
        fpm.add_gvn_pass();
        fpm.add_cfg_simplification_pass();
        fpm.add_basic_alias_analysis_pass();
        fpm.add_promote_memory_to_register_pass();
        fpm.add_instruction_combining_pass();
        fpm.add_reassociate_pass();

        fpm.initialize();

        let file = std::fs::read_to_string("./test.silver").unwrap();

        let mut types: HashMap<String, BasicTypeEnum> = HashMap::new();
        types.insert("u8".to_string(), inkwell::types::BasicTypeEnum::IntType(context.i8_type()));
        types.insert("u64".to_string(), inkwell::types::BasicTypeEnum::IntType(context.i64_type()));

        let mut compiler = Compiler {
            context: &context,
            builder: &builder,
            fpm: &fpm,
            module: &module,

            variables: HashMap::new(),
            fn_val_opt: None,
            types,
        };
        
        let mut remnant = file.as_str().trim();
        
        while remnant.trim() != "" {
            let (remn, expr) = TopLevelExpr::parse(remnant).unwrap();
            println!("EXPR: {:#?}", expr);
            remnant = remn.trim_start();

            compiler.compile_tl_expr(&expr).unwrap();
        }

        compiler.module.print_to_stderr();
        compiler.module.print_to_file("./test.ll").unwrap();
        println!("DONE DONE");
    }
}
