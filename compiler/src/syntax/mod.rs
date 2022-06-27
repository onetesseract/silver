pub mod number;
pub mod variable;
pub mod call;
pub mod vardef;
pub mod ty;
pub mod proto;
pub mod cdef;
pub mod template;
pub mod while_loop;
pub mod boolean;
pub mod if_expr;
pub mod ret;
pub mod cast;

use std::{sync::{Arc, RwLock}, collections::HashMap};

use inkwell::{values::{PointerValue, FunctionValue, BasicValue}, context::Context, module::Module, builder::Builder, types::{BasicTypeEnum, BasicType, BasicMetadataTypeEnum, AnyType}};
use parser::{lexer::LexString, syntax::{Expr, TlExpr, proto::FnProto, hints::Hints, ty::{Ty, TypeVariants}}};

use crate::value::{Value, CompilerType, TypeEnum};

use self::{number::compile_number, variable::compile_variable, call::compile_call, vardef::{compile_vardef, entry_block_alloca}, proto::compile_proto, ty::compile_basic_type, cdef::compile_cdef, boolean::compile_boolean, while_loop::compile_while_loop, if_expr::compile_if, ret::compile_return, cast::compile_cast};

pub type CompilationResult<'a> = Result<Value<'a>, CompilationError<'a>>;

#[derive(Debug)]
pub struct CompilationError<'a> {
    pub message: String,
    pub location: Option<LexString<'a>>,
}

impl<'a> CompilationError<'a> {
    pub fn new(message: String, location: LexString<'a>) -> Self {
        CompilationError { message, location: Some(location) }
    }
    pub fn new_anon(message: String) -> Self {
        CompilationError { message, location: None }
    }
}

#[derive(Debug, Clone)]
pub struct CompilerInternal<'ctx> {
    pub context: &'ctx Context, // TODO: async compilation
    pub module: Arc<Module<'ctx>>,

        
    pub global_variables: HashMap<&'ctx str, Value<'ctx>>,
    pub global_types: HashMap<Ty<'ctx>, CompilerType<'ctx>>,

    pub global_fn_hints: HashMap<&'ctx str, Hints<'ctx>>,

    // BasicMetadataTypeEnum doesn't hash. Look at this mess. TODO: fix. Look at what you have made
    // me do. TODO: switch to Values for functions
    pub global_overloadables: HashMap<&'ctx str, Vec<(Vec<BasicMetadataTypeEnum<'ctx>>, PointerValue<'ctx>, CompilerType<'ctx>)>>,

    pub global_fn_templates: HashMap<&'ctx str, TlExpr<'ctx>>,
    pub global_cached_fn_templates: HashMap<&'ctx str, Vec<(Vec<BasicTypeEnum<'ctx>>, FunctionValue<'ctx>)>>,
}

impl<'ctx> CompilerInternal<'ctx> {
    pub fn new(context: &'ctx Context, module: Arc<Module<'ctx>>) -> Self {
        let mut global_types = HashMap::new();
        global_types.insert(Ty { val: TypeVariants::Plain("u8")}, CompilerType::new(context.i8_type().as_basic_type_enum().as_any_type_enum(), TypeEnum::IntType));
        global_types.insert(Ty { val: TypeVariants::Plain("u64")}, CompilerType::new(context.i64_type().as_basic_type_enum().as_any_type_enum(), TypeEnum::IntType));
        global_types.insert(Ty { val: TypeVariants::Plain("f64")}, CompilerType::new(context.f64_type().as_basic_type_enum().as_any_type_enum(), TypeEnum::FloatType));
        global_types.insert(Ty { val: TypeVariants::Plain("bool")}, CompilerType::new(context.custom_width_int_type(1).as_basic_type_enum().as_any_type_enum(), TypeEnum::BoolType));
        CompilerInternal { context, module, global_variables: HashMap::new(), global_types, global_fn_hints: HashMap::new(), global_overloadables: HashMap::new(), global_fn_templates: HashMap::new(), global_cached_fn_templates: HashMap::new() }
    }
}

#[derive(Debug, Clone)]
pub struct CompilerInstance<'ctx> {
    pub compiler: Arc<RwLock<CompilerInternal<'ctx>>>,
    pub local_variables: Arc<RwLock<HashMap<&'ctx str, Value<'ctx>>>>,
    pub local_types: HashMap<Ty<'ctx>, CompilerType<'ctx>>,

    // pub do_var_as_ptr: bool,

    pub builder: Arc<Builder<'ctx>>,
    pub function: Option<FunctionValue<'ctx>>
}

impl<'ctx> CompilerInstance<'ctx> {
    pub fn new(compiler: Arc<RwLock<CompilerInternal<'ctx>>>) -> Self {
        CompilerInstance { compiler: compiler.clone(), local_variables: Arc::new(RwLock::new(HashMap::new())), /* do_var_as_ptr: false, */ builder: Arc::new(compiler.read().unwrap().context.create_builder()), function: None, local_types: HashMap::new() }
    }
}

pub fn expr_codegen<'a>(e: Expr<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    match *e.val {
        parser::syntax::ExprVal::Number(num) => compile_number(num, compiler),
        parser::syntax::ExprVal::Variable(var) => compile_variable(var, compiler),
        parser::syntax::ExprVal::Call(call) => compile_call(call, compiler),
        parser::syntax::ExprVal::Block(block) => {
            let mut last = Value::void_value(compiler.compiler.read().unwrap().context);
            for expr in block.exprs {
                last = expr_codegen(expr, compiler.clone())?;
            };
            Ok(last)
        },
        parser::syntax::ExprVal::VarDef(def) => compile_vardef(def, compiler),
        parser::syntax::ExprVal::CDef(cdef) => compile_cdef(cdef, compiler),
        parser::syntax::ExprVal::String(_s) => todo!(),
        parser::syntax::ExprVal::Boolean(b) => compile_boolean(b, compiler),
        parser::syntax::ExprVal::WhileLoop(while_expr) => compile_while_loop(while_expr, compiler),
        parser::syntax::ExprVal::IfExpr(if_expr) => compile_if(if_expr, compiler),
        parser::syntax::ExprVal::ReturnExpr(r) => compile_return(r, compiler),
        parser::syntax::ExprVal::Cast(c) => compile_cast(c, compiler),
    }
}

pub fn compile_fn<'a>(proto: FnProto<'a>, body: Option<Expr<'a>>, _hints: Option<Hints>, compiler: CompilerInstance<'a>, _named: bool) -> Result<FunctionValue<'a>, CompilationError<'a>> {
    let (fn_ty, args_ty, _, _) = compile_proto(proto.clone(), compiler.clone())?;
    let fn_val = compiler.compiler.read().unwrap().module.add_function(proto.name.render(), fn_ty, None);


    // compiler.compiler.write().unwrap().global_variables.insert(proto.name.render(), fn_val.as_global_value().as_pointer_value());
    // compiler.compiler.write().unwrap().global_fn_types.insert(proto.name.render(), args_ty);
    // if named {
    
    let ret_ty = match proto.return_ty.clone() {
        Some(s) => compile_basic_type(s, compiler.clone())?,
        None => CompilerType::new(compiler.compiler.read().unwrap().context.void_type().as_any_type_enum(), TypeEnum::VoidType),
    };

    if compiler.compiler.read().unwrap().global_overloadables.contains_key(proto.name.render()) {
        compiler.compiler.write().unwrap().global_overloadables.get_mut(proto.name.render()).unwrap().push((args_ty, fn_val.as_global_value().as_pointer_value(), ret_ty));
    } else {
        compiler.clone().compiler.write().unwrap().global_overloadables.insert(proto.name.render(), vec![(args_ty, fn_val.as_global_value().as_pointer_value(), ret_ty)]);
    }

    let body = match body {
        Some(s) => s,
        None => return Ok(fn_val),
    };

    let entry_block = compiler.clone().compiler.read().unwrap().context.append_basic_block(fn_val, "entry_block");
    compiler.clone().builder.position_at_end(entry_block);

    let mut compiler = compiler;
    compiler.function = Some(fn_val);

    for (i, arg) in fn_val.get_param_iter().enumerate() {
        let arg_name = proto.args[i].varname.render();
        let varspace = entry_block_alloca(arg.get_type(), compiler.clone(), arg_name);

        compiler.builder.build_store(varspace, arg);
        compiler.clone().local_variables.write().unwrap().insert(arg_name, Value::from(varspace.as_basic_value_enum(), CompilerType::new_ptr_to(compile_basic_type(proto.args[i].ty.clone(), compiler.clone())?, varspace.get_type().as_any_type_enum())));
    }

    let body = expr_codegen(body, compiler.clone())?;

    if proto.return_ty.is_some() {
        let body = if body.is_void() {
            return Err(CompilationError::new(format!("Trying to return void from a fn decl that wants {:?}", proto.return_ty.unwrap()), proto.name));
        } else {
            body
        };
        if body.ty != compile_basic_type(proto.return_ty.clone().unwrap(), compiler.clone())? {
            return Err(CompilationError::new(format!("Type mismatch: trying to return {:?} from a fn decl that wants {:?}", body.ty, proto.return_ty.unwrap()), proto.name));
        }
        compiler.builder.build_return(Some(&body.get_basic_value()));
    } else {
        compiler.builder.build_return(None);
    }

    if fn_val.verify(true) {
        // TODO: fpm
        return Ok(fn_val)
    } else {
        return Err(CompilationError::new("Bad function!".to_string(), proto.name))
    }
}

pub fn compile_tl_expr<'a>(e: TlExpr<'a>, compiler: CompilerInstance<'a>) -> Result<Option<FunctionValue<'a>>, CompilationError<'a>> {
    if let Some(ref _templ) = e.template {
        compiler.compiler.write().unwrap().global_fn_templates.insert(e.proto.name.render(), e);
        Ok(None)
    } else {
        Ok(Some(compile_fn(e.proto, e.body, e.hints, compiler, true)?))
    }
    // match e {
    //     TlExpr::Extern(hints, proto) => compile_fn(proto, None, hints, compiler),
    //     TlExpr::Func(hints, proto, body) => compile_fn(proto, Some(body), /* that I used to know */ hints, compiler),
    // }
}
