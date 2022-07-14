use inkwell::{values::BasicValue, types::AnyType};
use parser::syntax::string::StringExpr;

use crate::value::{Value, CompilerType};

use super::{CompilerInstance, CompilationResult};

pub fn compile_string<'a>(expr: StringExpr<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    let global = compiler.builder.build_global_string_ptr(expr.rendered.as_str(), "global_str").as_pointer_value();
    let v = Value::from(global.as_basic_value_enum(), CompilerType::new_ptr_to(CompilerType { underlying: compiler.compiler.read().unwrap().context.i8_type().as_any_type_enum(), ty: crate::value::TypeEnum::IntType }, global.get_type().as_any_type_enum()));

    Ok(v)
}
