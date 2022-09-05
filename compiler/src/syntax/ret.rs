use parser::syntax::ret::ReturnExpr;

use crate::value::Value;

use super::{CompilerInstance, CompilationResult, expr_codegen};

pub fn compile_return<'a>(expr: ReturnExpr<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    let ret_val = expr_codegen(expr.val, compiler.clone())?;
    compiler.builder.build_return(Some(&ret_val.get_basic_value()));

    Ok(Value::void_value(compiler.compiler.read().unwrap().context))
}
