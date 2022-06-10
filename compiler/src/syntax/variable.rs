use inkwell::values::{BasicValueEnum, BasicValue};
use parser::{syntax::variable::VariableExpr, lexer::LexString};

use super::{CompilerInstance, CompilationError};

pub fn compile_variable<'a>(expr: VariableExpr<'a>, compiler: CompilerInstance<'a>) -> Result<BasicValueEnum<'a>, CompilationError<'a>> {
    compile_variable_name(expr.name.render().to_string(), compiler, expr.name)
}

pub fn compile_variable_name<'a>(name: String, compiler: CompilerInstance<'a>, err_at: LexString<'a>) -> Result<BasicValueEnum<'a>, CompilationError<'a>> {
    let locals = compiler.local_variables.read().unwrap();
    let read = compiler.compiler.read().unwrap();
    let var = match locals.get(name.as_str()) {
        Some(s) => s,
        None => match read.global_variables.get(name.as_str()) {
            Some(s) => s,
            None => return Err(CompilationError::new(format!("Unable to find variable {}", name), err_at)),
        }
    };
    let val = if compiler.do_var_as_ptr {
        var.as_basic_value_enum()
    } else {
        compiler.builder.build_load(*var, format!("{}_variable_load", name).as_str())
    };
    return Ok(val)
}
