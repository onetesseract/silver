use parser::lexer::LexString;

use crate::{syntax::{CompilerInstance, CompilationError, variable::compile_variable_name, CompilationResult}, value::Value};

/// asm goes like <opcode> <args> <args> e.g addu8 x y where x and y are variabels
pub fn compile_asm<'a>(compiler: CompilerInstance<'a>, asm: String, error_at: LexString<'a>) -> CompilationResult<'a> {
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
    let mut args = vec![];
    while let Some(s) = words.next() {
        args.push(s);
    }


    let r = match opcode {
        "int_add" => Value::from_int_value(compiler.builder.build_int_add(variables[0].into_int_value(), variables[1].into_int_value(), "asm_int_add")),
        "float_add" => Value::from_float_value(compiler.builder.build_float_add(variables[0].into_float_value(), variables[1].into_float_value(), "asm_float_add")),
        "int_div" => Value::from_int_value(compiler.builder.build_int_signed_div(variables[0].into_int_value(), variables[1].into_int_value(), "asm_int_div")),
        "float_div" => Value::from_float_value(compiler.builder.build_float_div(variables[0].into_float_value(), variables[1].into_float_value(), "asm_float_div")),
        "int_sub" => Value::from_int_value(compiler.builder.build_int_sub(variables[0].into_int_value(), variables[1].into_int_value(), "asm_int_sub")),
        "float_sub" => Value::from_float_value(compiler.builder.build_float_sub(variables[0].into_float_value(), variables[1].into_float_value(), "asm_float_sub")),
        "int_cmp_eq" => Value::from_bool_value(compiler.builder.build_int_compare(inkwell::IntPredicate::EQ, variables[0].into_int_value(), variables[1].into_int_value(), "asm_int_cmp_eq")),
        "int_cmp_neq" => Value::from_bool_value(compiler.builder.build_int_compare(inkwell::IntPredicate::NE, variables[0].into_int_value(), variables[1].into_int_value(), "asm_int_cmp_eq")),
        "store_in" => { compiler.builder.build_store(variables[0].into_ptr_value(), variables[1].get_basic_value()); Value::void_value(compiler.compiler.read().unwrap().context)}
        unknown => return Err(CompilationError::new(format!("Unknown opcode {}", unknown), error_at)),
    };
    Ok(r)
}
