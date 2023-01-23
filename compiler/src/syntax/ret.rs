use parser::syntax::ret::ReturnExpr;

use crate::value::Value;

use super::{expr_codegen, CompilationResult, CompilerInstance};

pub fn compile_return<'a>(
    expr: ReturnExpr<'a>,
    compiler: CompilerInstance<'a>,
) -> CompilationResult<'a> {
    if let Some(val) = expr.val {
        let ret_val = expr_codegen(val, compiler.clone())?;
        compiler
            .builder
            .build_return(Some(&ret_val.get_basic_value()));
    } else {
        compiler.builder.build_return(None);
    }

    Ok(Value::void_value(compiler.compiler.read().unwrap().context))
}
