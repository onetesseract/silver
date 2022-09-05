use parser::syntax::cast::Cast;

use crate::value::Value;

use super::{CompilerInstance, CompilationResult, ty::compile_basic_type, expr_codegen};

pub fn compile_cast<'a>(expr: Cast<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    let ty = compile_basic_type(expr.ty, compiler.clone())?;
    let target = expr_codegen(expr.target, compiler.clone())?;

    let res = compiler.builder.build_bitcast(target.get_basic_value(), ty.try_basic_type().unwrap(), "bitcast");

    Ok(Value::from(res, ty))
}
