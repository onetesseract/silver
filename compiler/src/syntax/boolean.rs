use parser::syntax::keywords::Boolean;

use crate::value::Value;

use super::{CompilerInstance, CompilationResult};

pub fn compile_boolean<'a>(expr: Boolean<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    Ok(Value::from_bool_value(compiler.compiler.read().unwrap().context.custom_width_int_type(1).const_int(if expr.val {1} else {0}, false)))
}
