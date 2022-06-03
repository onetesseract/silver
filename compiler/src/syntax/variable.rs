use inkwell::values::{BasicValueEnum, BasicValue};
use parser::syntax::variable::VariableExpr;

use super::{CompilerInstance, CompilationError};

pub fn compile_variable<'a>(expr: VariableExpr<'a>, compiler: CompilerInstance<'a>) -> Result<BasicValueEnum<'a>, CompilationError<'a>> {
    let locals = compiler.local_variables.read().unwrap();
    let read = compiler.compiler.read().unwrap();
    let var = match locals.get(expr.name.render()) {
        Some(s) => s,
        None => match read.global_variables.get(expr.name.render()) {
            Some(s) => s,
            None => return Err(CompilationError::new(format!("Unable to find variable {}", expr.name.render()), expr.name)),
        }
    };
    let val = if compiler.do_var_as_ptr {
        var.as_basic_value_enum()
    } else {
        compiler.builder.build_load(*var, format!("{}_variable_load", expr.name.render()).as_str())
    };
    return Ok(val)
}
