pub mod boolean;
pub mod call;
pub mod cast;
pub mod cdef;
pub mod enumeration;
pub mod if_expr;
pub mod number;
pub mod proto;
pub mod ret;
pub mod string;
pub mod template;
pub mod ty;
pub mod vardef;
pub mod variable;
pub mod while_loop;

use std::{
    collections::HashMap,
    sync::{Arc, RwLock},
};

use inkwell::{
    basic_block::BasicBlock,
    builder::Builder,
    context::Context,
    module::Module,
    passes::PassManager,
    types::{AnyType, AnyTypeEnum, BasicMetadataTypeEnum, BasicType, BasicTypeEnum},
    values::{AnyValueEnum, BasicValue, BasicValueEnum, FunctionValue, PointerValue},
};
use parser::{
    lexer::LexString,
    syntax::{
        hints::Hints,
        proto::{FnProto, FnType},
        ty::{Ty, TypeVariants},
        Expr, ParseError, Tl, TlExpr,
    },
};

use crate::value::{CompilerType, TypeEnum, Value};

use self::{
    boolean::compile_boolean,
    call::compile_call,
    cast::compile_cast,
    cdef::compile_cdef,
    enumeration::compile_enum,
    if_expr::compile_if,
    number::compile_number,
    proto::compile_proto,
    ret::compile_return,
    string::compile_string,
    ty::compile_basic_type,
    vardef::{compile_vardef, entry_block_alloca},
    variable::compile_variable,
    while_loop::compile_while_loop,
};

pub type CompilationResult<'a> = Result<Value<'a>, CompilationError<'a>>;

#[derive(Debug)]
pub struct CompilationError<'a> {
    pub message: String,
    pub location: Option<LexString<'a>>,
    pub parse_err: Option<ParseError<'a>>,
}

impl<'a> CompilationError<'a> {
    pub fn new(message: String, location: LexString<'a>) -> Self {
        // panic!(
            // "{:?}",
            CompilationError {
                message,
                location: Some(location),
                parse_err: None
            }
        // )
    }
    pub fn new_anon(message: String) -> Self {
        // panic!(
            // "{:?}",
            CompilationError {
                message,
                location: None,
                parse_err: None
            }
        // )
    }
}

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub enum TargetType {
    Named(String),
    Bracket(String, String),
}

impl TargetType {
    pub fn from(t: parser::syntax::call::TargetType) -> Self {
        match t {
            parser::syntax::call::TargetType::Named(n) => Self::Named(n.name.render()),
            parser::syntax::call::TargetType::Brackets(a, b) => {
                Self::Bracket(a.render(), b.render())
            }
        }
    }

    pub fn render(&self) -> String {
        match self {
            Self::Named(n) => n.clone(),
            Self::Bracket(a, b) => format!("brackets-{}-{}", a, b),
        }
    }
}

#[derive(Debug, Clone)]
pub struct CompilerInternalConfig {
    pub int_width: u64,
}

#[derive(Debug, Clone)]
pub struct CompilerInternal<'ctx> {
    pub config: CompilerInternalConfig,
    pub context: &'ctx Context, // TODO: async compilation
    pub module: Arc<Module<'ctx>>,

    pub global_variables: HashMap<String, Value<'ctx>>,
    pub global_types: HashMap<Ty<'ctx>, CompilerType<'ctx>>,
    pub global_consts: HashMap<String, Value<'ctx>>,

    pub global_fn_hints: HashMap<TargetType, Hints<'ctx>>,

    // BasicMetadataTypeEnum doesn't hash. Look at this mess. TODO: fix. Look at what you have made
    // me do. TODO: switch to Values for functions
    pub global_overloadables: HashMap<
        TargetType,
        Vec<(
            Vec<BasicMetadataTypeEnum<'ctx>>,
            PointerValue<'ctx>,
            CompilerType<'ctx>,
        )>,
    >,

    pub global_fn_templates: HashMap<TargetType, TlExpr<'ctx>>,
    pub global_ty_templates: HashMap<String, TlExpr<'ctx>>,
    pub global_cached_fn_templates: HashMap<
        TargetType,
        Vec<(
            Vec<BasicTypeEnum<'ctx>>,
            (FunctionValue<'ctx>, CompilerType<'ctx>),
        )>,
    >,
    pub global_macros: HashMap<(TargetType, FnType), (FnProto<'ctx>, Expr<'ctx>)>,

    pub sources: HashMap<String, String>,

    pub fpm: Arc<PassManager<FunctionValue<'ctx>>>,
}

impl<'ctx> CompilerInternal<'ctx> {
    pub fn new(
        context: &'ctx Context,
        module: Arc<Module<'ctx>>,
        cfg: CompilerInternalConfig,
    ) -> Self {
        let mut global_types = HashMap::new();
        global_types.insert(
            Ty {
                val: TypeVariants::Plain("u8".to_string()),
                template: None,
            },
            CompilerType::new(
                context.i8_type().as_basic_type_enum().as_any_type_enum(),
                TypeEnum::IntType,
            ),
        );
        global_types.insert(
            Ty {
                val: TypeVariants::Plain("u32".to_string()),
                template: None,
            },
            CompilerType::new(
                context.i32_type().as_basic_type_enum().as_any_type_enum(),
                TypeEnum::IntType,
            ),
        );
        global_types.insert(
            Ty {
                val: TypeVariants::Plain("f32".to_string()),
                template: None,
            },
            CompilerType::new(
                context.f32_type().as_basic_type_enum().as_any_type_enum(),
                TypeEnum::FloatType,
            ),
        );
        global_types.insert(
            Ty {
                val: TypeVariants::Plain("u64".to_string()),
                template: None,
            },
            CompilerType::new(
                context.i64_type().as_basic_type_enum().as_any_type_enum(),
                TypeEnum::IntType,
            ),
        );
        global_types.insert(
            Ty {
                val: TypeVariants::Plain("f64".to_string()),
                template: None,
            },
            CompilerType::new(
                context.f64_type().as_basic_type_enum().as_any_type_enum(),
                TypeEnum::FloatType,
            ),
        );
        global_types.insert(
            Ty {
                val: TypeVariants::Plain("bool".to_string()),
                template: None,
            },
            CompilerType::new(
                context
                    .custom_width_int_type(1)
                    .as_basic_type_enum()
                    .as_any_type_enum(),
                TypeEnum::BoolType,
            ),
        );
        // setup the fpm

        let fpm = PassManager::create(module.clone());
        fpm.initialize();
        fpm.add_instruction_combining_pass();
        fpm.add_instruction_simplify_pass();
        fpm.add_gvn_pass();
        fpm.add_cfg_simplification_pass();
        fpm.add_basic_alias_analysis_pass();
        fpm.add_demote_memory_to_register_pass();
        fpm.add_instruction_simplify_pass();
        fpm.add_reassociate_pass();

        fpm.finalize();

        CompilerInternal {
            config: cfg,
            context,
            module,
            global_variables: HashMap::new(),
            global_types,
            global_fn_hints: HashMap::new(),
            global_overloadables: HashMap::new(),
            global_fn_templates: HashMap::new(),
            global_cached_fn_templates: HashMap::new(),
            global_ty_templates: HashMap::new(),
            sources: HashMap::new(),
            fpm: Arc::new(fpm),
            global_consts: HashMap::new(),
            global_macros: HashMap::new(),
        }
    }
}

#[derive(Debug, Clone)]
pub struct VarWrapper<'a> {
    vars: HashMap<String, Value<'a>>,
}

#[derive(Debug, Clone)]
pub struct CompilerInstance<'ctx> {
    pub compiler: Arc<RwLock<CompilerInternal<'ctx>>>,
    pub local_variables: Arc<RwLock<VarWrapper<'ctx>>>,
    pub local_types: HashMap<Ty<'ctx>, CompilerType<'ctx>>,

    pub do_var_as_ptr: bool,

    pub builder: Arc<Builder<'ctx>>,
    pub function: Option<FunctionValue<'ctx>>,

    pub break_to: Option<BasicBlock<'ctx>>,
    pub cont_block: Option<BasicBlock<'ctx>>,
    // pub return_to_this_block: Option<BasicBlock<'ctx>>,
}

impl<'ctx> CompilerInstance<'ctx> {
    pub fn new(compiler: Arc<RwLock<CompilerInternal<'ctx>>>) -> Self {
        CompilerInstance {
            compiler: compiler.clone(),
            local_variables: Arc::new(RwLock::new(VarWrapper {
                vars: HashMap::new(),
            })),
            do_var_as_ptr: false,
            builder: Arc::new(compiler.read().unwrap().context.create_builder()),
            function: None,
            local_types: HashMap::new(),
            break_to: None,
            cont_block: None, /* return_to_this_block: None */
        }
    }
}

pub fn expr_codegen<'a>(e: Expr<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    // println!("Compiling expr {:?}", e);
    match *e.val {
        parser::syntax::ExprVal::Number(num) => compile_number(num, compiler),
        parser::syntax::ExprVal::Variable(var) => compile_variable(var, compiler),
        parser::syntax::ExprVal::Call(call) => compile_call(call, compiler),
        parser::syntax::ExprVal::Block(block) => {
            let mut last = Value::void_value(compiler.compiler.read().unwrap().context);
            for expr in block.exprs {
                last = expr_codegen(expr, compiler.clone())?;
            }
            Ok(last)
        }
        parser::syntax::ExprVal::VarDef(def) => compile_vardef(def, compiler),
        parser::syntax::ExprVal::CDef(cdef) => compile_cdef(cdef, compiler),
        parser::syntax::ExprVal::String(s) => compile_string(s, compiler),
        parser::syntax::ExprVal::Boolean(b) => compile_boolean(b, compiler),
        parser::syntax::ExprVal::WhileLoop(while_expr) => compile_while_loop(while_expr, compiler),
        parser::syntax::ExprVal::IfExpr(if_expr) => compile_if(if_expr, compiler),
        parser::syntax::ExprVal::ReturnExpr(r) => compile_return(r, compiler),
        parser::syntax::ExprVal::Cast(c) => compile_cast(c, compiler),
        parser::syntax::ExprVal::Break(kwd) => {
            if let Some(s) = compiler.break_to {
                compiler.builder.build_unconditional_branch(s);
                Ok(Value::void_value(compiler.compiler.read().unwrap().context))
            } else {
                return Err(CompilationError::new(format!("Cannot break here"), kwd));
            }
        }
        parser::syntax::ExprVal::Char(c) => Ok(Value::from_int_value(
            compiler
                .compiler
                .read()
                .unwrap()
                .context
                .i8_type()
                .const_int(c.rendered.as_bytes()[0] as u64, false),
        )),
        _ => panic!(),
    }
}

pub fn compile_fn<'a>(
    proto: FnProto<'a>,
    body: Option<Expr<'a>>,
    _hints: Option<Hints>,
    compiler: CompilerInstance<'a>,
    _named: bool,
) -> Result<FunctionValue<'a>, CompilationError<'a>> {
    let (fn_ty, args_ty, args_complete_ty, _) = compile_proto(proto.clone(), compiler.clone())?;
    let mut fn_val = compiler.compiler.read().unwrap().module.add_function(
        TargetType::from(proto.name.clone()).render().as_str(),
        fn_ty,
        None,
    );

    // let f = compiler.compiler.read().unwrap().module.get_function

    let ret_ty = match proto.return_ty.clone() {
        Some(s) => compile_basic_type(s, compiler.clone())?,
        None => CompilerType::new(
            compiler
                .compiler
                .read()
                .unwrap()
                .context
                .void_type()
                .as_any_type_enum(),
            TypeEnum::VoidType,
        ),
    };

    compiler.compiler.try_write().unwrap();

    if proto.overloadable
        || !matches!(proto.name, parser::syntax::call::TargetType::Named(_))
        || proto.class != FnType::Normal
    {
        if compiler
            .compiler
            .read()
            .unwrap()
            .global_overloadables
            .contains_key(&TargetType::from(proto.name.clone()))
        {
            let mut write = compiler.compiler.write().unwrap();
            write
                .global_overloadables
                .get_mut(&TargetType::from(proto.name.clone()))
                .unwrap()
                .push((args_ty, fn_val.as_global_value().as_pointer_value(), ret_ty));
        } else {
            compiler
                .clone()
                .compiler
                .write()
                .unwrap()
                .global_overloadables
                .insert(
                    TargetType::from(proto.name.clone()),
                    vec![(args_ty, fn_val.as_global_value().as_pointer_value(), ret_ty)],
                );
        }
    } else if let parser::syntax::call::TargetType::Named(name) = proto.name.clone() {
        let read = compiler.compiler.read().unwrap();

        if let Some(s) = read.global_variables.get(&name.name.render()) {
            let s = s.clone();
            drop(read);
            if let Some(val) = s.value.clone() {
                if let BasicValueEnum::PointerValue(ptr) = val.value {
                    if let AnyTypeEnum::FunctionType(p) = ptr.get_type().get_element_type() {
                        if let Some(fnval) = compiler
                            .compiler
                            .read()
                            .unwrap()
                            .module
                            .get_function(name.name.render().as_str())
                        {
                            if fnval.get_first_basic_block().is_some() {
                                if body.is_some() {
                                    return Err(CompilationError::new(
                                        format!(
                                            "Cannot redefine a function - {} is already defined",
                                            name.name.render()
                                        ),
                                        name.name,
                                    ));
                                } else {
                                    // unsafe {
                                    //     fn_val.delete();
                                    // }
                                    return Ok(fnval);
                                }
                            }
                            if fnval.get_params().len() != fn_val.get_params().len() {
                                return Err(CompilationError::new(
                                    format!(
                                        "Trying to implement {} with a different number of arguments",
                                        name.name.render()
                                    ),
                                    name.name,
                                ));
                            }
                            for (count, i) in fnval.get_params().iter().enumerate() {
                                if i.get_type() != fn_val.get_params()[count].get_type() {
                                    return Err(CompilationError::new(
                                    format!(
                                        "Trying to implement {} with different arguments - {:?} vs {:?}",
                                        name.name.render(),
                                        fnval.get_params(),
                                        fn_val.get_params()
                                    ),
                                    name.name,
                                ));
                                }
                            }
                            // swap the vals
                            let old_fn_val = fn_val;
                            fn_val = fnval;
                            // unsafe {
                            //     old_fn_val.delete();
                            // }
                        }
                    }
                } else {
                    return Err(CompilationError::new(format!("Cannot redefine a non-function variable as a function - {} is already defined", name.name.render()), name.name));
                }
            }
        } else {
            drop(read);
            compiler.compiler.try_write().unwrap();
            let ty = CompilerType::new(
                fn_val
                    .as_global_value()
                    .as_pointer_value()
                    .get_type()
                    .as_any_type_enum(),
                TypeEnum::FunctionType(args_complete_ty, Box::new(ret_ty)),
            );
            println!("HERE");
            compiler.compiler.try_write().unwrap();
            compiler.compiler.write().unwrap().global_variables.insert(
                name.name.render(),
                Value::from(
                    fn_val
                        .as_global_value()
                        .as_pointer_value()
                        .as_basic_value_enum(),
                    ty,
                ),
            );
            println!("HERE2");
        }
    }

    let body = match body {
        Some(s) => s,
        None => return Ok(fn_val),
    };

    let entry_block = compiler
        .clone()
        .compiler
        .read()
        .unwrap()
        .context
        .append_basic_block(fn_val, "entry_block");
    // let final_block = compiler.clone().compiler.read().unwrap().context.append_basic_block(fn_val, "final_block");
    compiler.clone().builder.position_at_end(entry_block);

    let mut compiler = compiler;
    compiler.function = Some(fn_val);

    for (i, arg) in fn_val.get_param_iter().enumerate() {
        let arg_name = proto.args[i].varname.render();
        let varspace = entry_block_alloca(arg.get_type(), compiler.clone(), arg_name.clone());

        compiler.builder.build_store(varspace, arg);
        compiler
            .clone()
            .local_variables
            .write()
            .unwrap()
            .vars
            .insert(
                arg_name,
                Value::from(
                    varspace.as_basic_value_enum(),
                    CompilerType::new_ptr_to(
                        compile_basic_type(proto.args[i].ty.clone(), compiler.clone())?,
                        varspace.get_type().as_any_type_enum(),
                    ),
                ),
            );
    }

    // compiler.return_to_this_block = Some(final_block);

    let body = expr_codegen(body, compiler.clone())?;

    // compiler.builder.position_at_end(entry_block);
    // compiler.builder.build_unconditional_branch(final_block);
    //
    // compiler.builder.position_at_end(final_block);

    if proto.return_ty.is_some() {
        let body = if body.is_void() {
            return Err(CompilationError::new(
                format!(
                    "Trying to return void from a fn decl that wants {:?}",
                    proto.return_ty.unwrap()
                ),
                proto.name.get_location(),
            ));
        } else {
            body
        };
        if body.ty != compile_basic_type(proto.return_ty.clone().unwrap(), compiler.clone())? {
            println!("Body dump:\n\n{:#?}", body);
            return Err(CompilationError::new(
                format!(
                    "Type mismatch: trying to return {:?} from a fn decl that wants {:?}.\n\nFull body dump:\n{:?}",
                    body.ty,
                    proto.return_ty.unwrap(),
                    body
                ),
                proto.name.get_location(),
            ));
        }
        compiler.builder.build_return(Some(&body.get_basic_value()));
    } else {
        compiler.builder.build_return(None);
    }

    if fn_val.verify(true) {
        // TODO: fpm
        println!("FPM-ming");
        // compiler.compiler.read().unwrap().fpm.run_on(&fn_val);
        return Ok(fn_val);
    } else {
        compiler.compiler.read().unwrap().module.print_to_stderr();
        println!("WARNING: BAD FUNCTION, but ignoring lol");
        // compiler.compiler.read().unwrap().fpm.run_on(&fn_val);
        return Ok(fn_val);
        // return Err(CompilationError::new("Bad function!".to_string(), proto.name))
    }
}

pub fn compile_tl_expr<'a>(
    e: TlExpr<'a>,
    compiler: CompilerInstance<'a>,
) -> Result<Option<FunctionValue<'a>>, CompilationError<'a>> {
    println!("Compiling {:#?}", e);
    if let Tl::CDef(c) = e.tl {
        compile_cdef(c, compiler)?;
        return Ok(None);
    }
    if e.template.is_some() {
        match e.tl {
            Tl::Function(ref proto, _) => compiler
                .compiler
                .write()
                .unwrap()
                .global_fn_templates
                .insert(TargetType::from(proto.name.clone()), e),
            Tl::Typedef(ref typedef, _) => compiler
                .compiler
                .write()
                .unwrap()
                .global_ty_templates
                .insert(typedef.render(), e),
            Tl::CDef(_) => todo!(),
            Tl::Enum(_) => todo!(),
            Tl::Macro(_, _) => todo!(),
        };
        Ok(None)
    } else {
        match e.tl {
            Tl::Function(proto, body) => {
                Ok(Some(compile_fn(proto, body, e.hints, compiler, true)?))
            }
            Tl::Typedef(name, ty) => {
                let ty = compile_basic_type(ty, compiler.clone())?;
                println!("here");
                compiler.compiler.write().unwrap().global_types.insert(
                    Ty {
                        val: TypeVariants::Plain(name.render()),
                        template: None,
                    },
                    ty,
                );
                println!("here now");
                Ok(None)
            }
            Tl::CDef(_) => todo!(),
            Tl::Enum(e) => {
                compile_enum(e, compiler)?;
                Ok(None)
            }
            Tl::Macro(proto, body) => {
                compiler.compiler.write().unwrap().global_macros.insert(
                    (TargetType::from(proto.name.clone()), proto.class.clone()),
                    (proto, body.unwrap()),
                );
                Ok(None)
            }
        }
    }
}
