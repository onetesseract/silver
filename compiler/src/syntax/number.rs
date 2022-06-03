use inkwell::values::{BasicValueEnum, BasicValue};
use parser::syntax::number::NumberExpr;

use super::{CompilationError, CompilerInstance};

pub fn compile_number<'a>(expr: NumberExpr<'a>, compiler: CompilerInstance<'a>) -> Result<BasicValueEnum<'a>, CompilationError<'a>> {
    let val = expr.value.render();
    if val.contains('.') {
        let f = match val.parse::<f64>() {
            Ok(v) => v,
            Err(e) => return Err(CompilationError::new(format!("Invalid float value {} - {}", val, e), expr.value))
        };
        let val = compiler.compiler.read().unwrap().context.f64_type().const_float(f).as_basic_value_enum();
        return Ok(val);
    } else {
        let i = match val.parse::<i64>() {
            Ok(v) => v,
            Err(e) => return Err(CompilationError::new(format!("Invalid int value {} - {}", val, e), expr.value))
        };
        let val = compiler.compiler.read().unwrap().context.i64_type().const_int(i as u64, true).as_basic_value_enum();
        return Ok(val);
    }
}
