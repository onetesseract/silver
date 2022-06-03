pub mod number;
pub mod variable;
pub mod call;
pub mod vardef;
pub mod ty;
pub mod proto;

use std::{sync::{Arc, RwLock}, collections::HashMap};

use inkwell::{values::{BasicValueEnum, PointerValue, FunctionValue, BasicValue}, context::Context, module::Module, builder::Builder, types::{BasicTypeEnum, AnyTypeEnum, BasicType}};
use parser::{lexer::LexString, syntax::{Expr, TlExpr, proto::FnProto, hints::Hints}};

use self::{number::compile_number, variable::compile_variable, call::compile_call, vardef::{compile_vardef, entry_block_alloca}, proto::compile_proto, ty::compile_basic_type};

#[derive(Debug)]
pub struct CompilationError<'a> {
    pub message: String,
    pub location: LexString<'a>,
}

impl<'a> CompilationError<'a> {
    pub fn new(message: String, location: LexString<'a>) -> Self {
        CompilationError { message, location }
    }
}

pub struct CompilerInternal<'ctx> {
    pub context: &'ctx Context, // TODO: async compilation
    pub module: Module<'ctx>,
    
    pub global_variables: HashMap<&'ctx str, PointerValue<'ctx>>,
    pub global_basic_types: HashMap<&'ctx str, BasicTypeEnum<'ctx>>,
    pub global_any_types: HashMap<&'ctx str, AnyTypeEnum<'ctx>>,
}

impl<'ctx> CompilerInternal<'ctx> {
    pub fn new(context: &'ctx Context, filename: &'ctx str) -> Self {
        let mut global_basic_types = HashMap::new();
        global_basic_types.insert("uchar", context.i8_type().as_basic_type_enum());
        CompilerInternal { context, module: context.create_module(filename), global_variables: HashMap::new(), global_basic_types, global_any_types: HashMap::new() }
    }
}

#[derive(Clone)]
pub struct CompilerInstance<'ctx> {
    pub compiler: Arc<RwLock<CompilerInternal<'ctx>>>,
    pub local_variables: Arc<RwLock<HashMap<&'ctx str, PointerValue<'ctx>>>>,
    pub do_var_as_ptr: bool,

    pub builder: Arc<Builder<'ctx>>,
    pub function: Option<FunctionValue<'ctx>>
}

impl<'ctx> CompilerInstance<'ctx> {
    pub fn new(compiler: Arc<RwLock<CompilerInternal<'ctx>>>) -> Self {
        CompilerInstance { compiler: compiler.clone(), local_variables: Arc::new(RwLock::new(HashMap::new())), do_var_as_ptr: false, builder: Arc::new(compiler.read().unwrap().context.create_builder()), function: None }
    }
}

pub trait Codegen {
    fn codegen(&mut self, compiler: RwLock<CompilerInstance>) -> Result<Option<BasicValueEnum>, CompilationError>;
}

pub fn expr_codegen<'a>(e: Expr<'a>, compiler: CompilerInstance<'a>) -> Result<Option<BasicValueEnum<'a>>, CompilationError<'a>> {
    match *e.val {
        parser::syntax::ExprVal::Number(num) => Ok(Some(compile_number(num, compiler)?)),
        parser::syntax::ExprVal::Variable(var) => Ok(Some(compile_variable(var, compiler)?)),
        parser::syntax::ExprVal::Call(call) => compile_call(call, compiler),
        parser::syntax::ExprVal::Block(block) => {
            // TODO: give syntax
            for expr in block.exprs {
                expr_codegen(expr, compiler.clone())?;
            };
            Ok(None)
        },
        parser::syntax::ExprVal::VarDef(def) => Ok(Some(compile_vardef(def, compiler)?.as_basic_value_enum())),
    }
}

pub fn compile_fn<'a>(proto: FnProto<'a>, body: Option<Expr<'a>>, _hints: Option<Hints>, compiler: CompilerInstance<'a>) -> Result<FunctionValue<'a>, CompilationError<'a>> {
    let fn_ty = compile_proto(proto.clone(), compiler.clone())?;
    let fn_val = compiler.compiler.read().unwrap().module.add_function(proto.name.render(), fn_ty, None);

    compiler.compiler.write().unwrap().global_variables.insert(proto.name.render(), fn_val.as_global_value().as_pointer_value());

    let body = match body {
        Some(s) => s,
        None => return Ok(fn_val),
    };

    let entry_block = compiler.compiler.read().unwrap().context.append_basic_block(fn_val, "entry_block");
    compiler.builder.position_at_end(entry_block);

    let mut compiler = compiler;
    compiler.function = Some(fn_val);

    for (i, arg) in fn_val.get_param_iter().enumerate() {
        let arg_name = proto.args[i].varname.render();
        let varspace = entry_block_alloca(arg.get_type(), compiler.clone(), arg_name);

        compiler.builder.build_store(varspace, arg);
        compiler.local_variables.write().unwrap().insert(arg_name, varspace);
    }

    let body = expr_codegen(body, compiler.clone())?;

    if proto.return_ty.is_some() {
        let body = match body {
            Some(body) => body,
            None => return Err(CompilationError::new(format!("Trying to return void from a fn decl that wants {:?}", proto.return_ty.unwrap()), proto.name)),
        };
        if body.get_type() != compile_basic_type(proto.return_ty.clone().unwrap(), compiler.clone())? {
            return Err(CompilationError::new(format!("Type mismatch: trying to return {:?} from a fn decl that wants {:?}", body.get_type(), proto.return_ty.unwrap()), proto.name));
        }
        compiler.builder.build_return(Some(&body));
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

pub fn compile_tl_expr<'a>(e: TlExpr<'a>, compiler: CompilerInstance<'a>) -> Result<FunctionValue<'a>, CompilationError<'a>> {
    match e {
        TlExpr::Extern(hints, proto) => compile_fn(proto, None, hints, compiler),
        TlExpr::Func(hints, proto, body) => compile_fn(proto, Some(body), /* that I used to know */ hints, compiler),
    }
}
