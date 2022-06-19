use inkwell::values::{BasicValueEnum, BasicValue};
use parser::syntax::keywords::Boolean;

use super::{CompilerInstance, CompilationError};

pub fn compile_boolean<'a>(expr: Boolean<'a>, compiler: CompilerInstance<'a>) -> Result<BasicValueEnum<'a>, CompilationError<'a>> {
    Ok(compiler.compiler.read().unwrap().context.custom_width_int_type(1).const_int(if expr.val {1} else {0}, false).as_basic_value_enum())
}
