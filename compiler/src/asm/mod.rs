use inkwell::values::{BasicValueEnum, BasicValue};
use parser::lexer::LexString;

use crate::syntax::{CompilerInstance, CompilationError, variable::compile_variable_name};

/// asm goes like <opcode> <args> <args> e.g addu8 x y where x and y are variabels
pub fn compile_asm<'a>(compiler: CompilerInstance<'a>, asm: String, error_at: LexString<'a>) -> Result<Option<BasicValueEnum<'a>>, CompilationError<'a>> {
    let mut words = asm.split_whitespace();
    let opcode = match words.next() {
        Some(s) => s,
        None => return Err(CompilationError::new("Expected an opcode".to_string(), error_at))
    };

    let mut compiler = compiler.clone();

    compiler.do_var_as_ptr = false;

    let mut variables = vec![];
    while let Some(s) = words.next() {
        variables.push(compile_variable_name(s.to_string(), compiler.clone(), error_at.clone())?)
    }

    let r = match opcode {
        "int_add" => Some(compiler.builder.build_int_add(variables[0].into_int_value(), variables[1].into_int_value(), "asm_int_add").as_basic_value_enum()),
        unknown => return Err(CompilationError::new(format!("Unknown opcode {}", unknown), error_at)),
    };
    Ok(r)
}
