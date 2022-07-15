use parser::{syntax::variable::VariableExpr, lexer::LexString};

use super::{CompilerInstance, CompilationError, CompilationResult};

pub fn compile_variable<'a>(expr: VariableExpr<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    compile_variable_name(expr.name.render().to_string(), compiler, expr.name)
}

pub fn compile_variable_name<'a>(name: String, compiler: CompilerInstance<'a>, err_at: LexString<'a>) -> CompilationResult<'a> {
    let locals = compiler.local_variables.read().unwrap();
    let read = compiler.compiler.read().unwrap();
    let var = match locals.get(name.as_str()) {
        Some(s) => s,
        None => match read.global_variables.get(name.as_str()) {
            Some(s) => s,
            None => return Err(CompilationError::new(format!("Unable to find variable {}", name), err_at)),
        }
    };
    let val = // if compiler.do_var_as_ptr {
        var.clone();
    // } else {
    //     Value::from(compiler.builder.build_load(var.get_basic_value().into_pointer_value(), format!("{}_variable_load", name).as_str()), match var.ty.ty.clone() {
    //         TypeEnum::PointerType(ptr) => *ptr,
    //         _ => panic!(),
    //     })
    // };
    return Ok(val)
}
