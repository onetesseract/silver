use std::collections::HashMap;

use inkwell::{context::Context, builder::Builder, passes::PassManager, values::{FunctionValue, PointerValue, BasicMetadataValueEnum, CallableValue, BasicValueEnum, BasicValue, AnyValue}, module::{Module, Linkage}, types::{BasicTypeEnum, AnyTypeEnum, PointerType, BasicType, FunctionType, AnyType, BasicMetadataTypeEnum}, AddressSpace};
use parser::syntax::{expr::Expr, fndef::{FnDef, FnProto}, variable::Variable, literal::Literal, toplevel::TopLevelExpr};

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
    fn create_entry_block_alloca(&self, name: &str, ty: BasicTypeEnum<'ctx>) -> PointerValue<'ctx> {
        let builder = self.context.create_builder();

        let entry = self.fn_value().get_first_basic_block().unwrap();

        match entry.get_first_instruction() {
            Some(first) => builder.position_before(&first),
            None => builder.position_at_end(entry),
        }
        builder.build_alloca(ty, name)
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

    /// Compiles the given Expr into a BasicTypeEnum
    fn compile_expr(&mut self, expr: &Expr) -> Result<Option<BasicValueEnum<'ctx>>, String> {
        match expr {
            Expr::Call(call) => {
                match call.is_infix {
                    true => todo!(),
                    false => {
                        let mut args = vec![];
                        for i in &call.args {
                            args.push(match self.compile_expr(i)? {
                                Some(expr) => expr,
                                None => return Err("y u wanna call with a null value as arg".to_string()),
                            });
                        }
                        let target = match self.compile_expr(&call.function)? {
                            Some(value) => match value {
                                BasicValueEnum::PointerValue(p) => p,
                                _ => return Err(format!("{:?} is not a pointer value yet you want to call it. curious.", value))
                            },
                            None => return Err("You can't call a null value".to_string()),
                        };
                        self.build_call(target, args)
                    },
                }
            },
            Expr::Atom(atom) => match atom {
                parser::syntax::atom::Atom::Variable(var) => Ok(Some(self.compile_variable(&var)?.as_basic_value_enum())), // TODO: uhhh should this be loaded
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
                let ty = self.variable_to_ty(&vardef.ty.name)?;
                let var = self.create_entry_block_alloca(vardef.variable.name, ty);
                self.variables.insert(vardef.variable.name.to_string(), var);
                Ok(Some(var.as_basic_value_enum()))
            },
            Expr::FnDef(_) => todo!("lambdas"),
        }
    }

    fn compile_literal(&self, literal: &Literal) -> BasicValueEnum<'ctx> {
        match literal { // TODO: infer size of thing
            Literal::Str(s) => {
                let mut values = vec![];
                for c in s.chars() {
                    values.push(self.context.i8_type().const_int(c as u64, false))
                }
                self.context.i8_type().const_array(values.as_slice()).as_basic_value_enum()
            },
            Literal::Int(i) => self.context.i64_type().const_int(*i as u64, true).as_basic_value_enum(),
            Literal::Float(f) => self.context.f64_type().const_float(*f).as_basic_value_enum(),
        }
    }

    fn compile_variable(&self, variable: &Variable) -> Result<PointerValue<'ctx>, String> {
        match variable {
            Variable::Reference(var) => {
                let compiled_var = self.compile_variable(var)?;
                let varspace = self.create_entry_block_alloca("tmp_reference_variable_storage", compiled_var.get_type().as_basic_type_enum())   ;
                self.builder.build_store(varspace, compiled_var);
                Ok(varspace)
            },
            Variable::Dereference(var) => { // TODO: rewrite this hot garbage
                let compiled_var = self.compile_variable(var)?;
                // let to_be_derefed = self.builder.build_load(compiled_var, "tmp_deref_variable_load");
                match compiled_var.get_type().get_element_type() /* to_be_derefed */ {
                    AnyTypeEnum::PointerType(_val) => {}, // self.builder.build_load(val, "tmp_deref_variable"),
                    _ => return Err(format!("you can't dereference {:?}", var)),
                };
                Ok(self.builder.build_load(compiled_var, "tmp_deref_variable").into_pointer_value())
                // let varspace = self.create_entry_block_alloca("tmp_variable_deref_storage", root_value.get_type());
                // self.builder.build_store(varspace,root_value);
                // Ok(Some(varspace))
            },
            Variable::Identifier(id) => Ok(match self.variables.get(id.name) {
                Some(s) => *s,
                None => return Err(format!("Cannot find variable {}", id.name)),
            }),
        }
    }

    fn variable_to_ty(&self, variable: &Variable) -> Result<BasicTypeEnum<'ctx>, String> {
        match variable {
            Variable::Reference(var) => {
                Ok(self.variable_to_ty(var)?.ptr_type(AddressSpace::Generic).as_basic_type_enum())
            },
            Variable::Dereference(_) => Err(format!("{:?} is not a valid type", variable)),
            Variable::Identifier(id) => Ok(match self.types.get(id.name) {
                Some(s) => *s,
                None => return Err(format!("Cannot find type {}", id.name)),
            }),
        }
    }

    fn compile_fn_proto(&self, proto: &FnProto) -> Result<FunctionType<'ctx>, String> {
        let mut args_types: Vec<BasicMetadataTypeEnum> = vec![];
        for i in &proto.args {
            args_types.push(self.variable_to_ty(&i.ty.name)?.into());
        }
        Ok(match &proto.return_type {
            Some(var) => self.variable_to_ty(&var.name)?.fn_type(args_types.as_slice(), false),
            None => self.context.void_type().fn_type(args_types.as_slice(), false),
        })
    }

    fn compile_fn(&mut self, func: &FnDef, body: Option<&Expr>) -> Result<FunctionValue<'ctx>, String> {
        let proto = self.compile_fn_proto(&func.proto)?;
        let fn_val = self.module.add_function(func.name.name, proto, Some(Linkage::External));

        // set arg names
        for (i, arg) in fn_val.get_param_iter().enumerate() {
            arg.set_name(func.proto.args[i].variable.name); // TODO: tf does this code do
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
            let arg_name = func.proto.args[i].variable.name;
            let varspace = self.create_entry_block_alloca(arg_name, arg.get_type());

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
