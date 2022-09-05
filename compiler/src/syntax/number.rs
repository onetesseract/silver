use parser::syntax::number::NumberExpr;

use crate::value::Value;

use super::{CompilationError, CompilerInstance, CompilationResult};

pub fn compile_number<'a>(expr: NumberExpr<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    let val = expr.value.render();
    if val.contains('.') {
        let f = match val.parse::<f64>() {
            Ok(v) => v,
            Err(e) => return Err(CompilationError::new(format!("Invalid float value {} - {}", val, e), expr.value))
        };
        let val = Value::from_float_value(compiler.compiler.read().unwrap().context.f64_type().const_float(f));
        return Ok(val);
    } else {
        let i = match val.parse::<i64>() {
            Ok(v) => v,
            Err(e) => return Err(CompilationError::new(format!("Invalid int value {} - {}", val, e), expr.value))
        };
        let val = Value::from_int_value(
            if let Some(s) = expr.width {
                compiler.compiler.read().unwrap().context.custom_width_int_type(s.render().parse::<u32>().unwrap()).const_int(i as u64, true)
            } else {
                compiler.compiler.read().unwrap().context.i64_type().const_int(i as u64, true)
            }
        );
        return Ok(val);
    }
}
