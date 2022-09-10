use inkwell::{types::AnyType, values::BasicValue};
use parser::lexer::LexString;

use crate::{
    syntax::{
        variable::compile_variable_name, CompilationError, CompilationResult, CompilerInstance,
    },
    value::{CompilerType, Value},
};

/// asm goes like <opcode> <args> <args> e.g addu8 x y where x and y are variabels
pub fn compile_asm<'a>(
    compiler: CompilerInstance<'a>,
    asm: String,
    error_at: LexString<'a>,
) -> CompilationResult<'a> {
    let mut words = asm.split_whitespace();
    let opcode = match words.next() {
        Some(s) => s,
        None => {
            return Err(CompilationError::new(
                "Expected an opcode".to_string(),
                error_at,
            ))
        }
    };

    let mut compiler = compiler.clone();

    compiler.do_var_as_ptr = false; // TODO

    if opcode == "store_in" {
        compiler.do_var_as_ptr = true;
        let v1 = compile_variable_name(
            words.next().unwrap().to_string(),
            compiler.clone(),
            error_at.clone(),
        )?;
        compiler.do_var_as_ptr = false;
        let v2 = compile_variable_name(
            words.next().unwrap().to_string(),
            compiler.clone(),
            error_at.clone(),
        )?;
        compiler
            .builder
            .build_store(v1.into_ptr_value(), v2.get_basic_value());
        return Ok(Value::void_value(compiler.compiler.read().unwrap().context));
    }

    // if opcode == "raw_store_in" {
    //     let v1 = compile_variable_name(words.next().unwrap().to_string(), compiler.clone(), error_at.clone())?;
    //     let v2 = compile_variable_name(words.next().unwrap().to_string(), compiler.clone(), error_at.clone())?;
    //     compiler.builder.build_store(v1.into_ptr_value(), v2.get_basic_value());
    //     return Ok(Value::void_value(compiler.compiler.read().unwrap().context));
    // }

    let mut variables = vec![];
    while let Some(s) = words.next() {
        variables.push(compile_variable_name(
            s.to_string(),
            compiler.clone(),
            error_at.clone(),
        )?)
    }

    let mut args = vec![];
    while let Some(s) = words.next() {
        args.push(s);
    }

    let r = match opcode {
        "int_add" => Value::from_int_value(compiler.builder.build_int_add(
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_add",
        )),
        "float_add" => Value::from_float_value(compiler.builder.build_float_add(
            variables[0].into_float_value(),
            variables[1].into_float_value(),
            "asm_float_add",
        )),
        "int_div" => Value::from_int_value(compiler.builder.build_int_signed_div(
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_div",
        )),
        "float_div" => Value::from_float_value(compiler.builder.build_float_div(
            variables[0].into_float_value(),
            variables[1].into_float_value(),
            "asm_float_div",
        )),
        "int_sub" => Value::from_int_value(compiler.builder.build_int_sub(
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_sub",
        )),
        "float_sub" => Value::from_float_value(compiler.builder.build_float_sub(
            variables[0].into_float_value(),
            variables[1].into_float_value(),
            "asm_float_sub",
        )),
        "int_cmp_eq" => Value::from_bool_value(compiler.builder.build_int_compare(
            inkwell::IntPredicate::EQ,
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_cmp_eq",
        )),
        "int_cmp_ult" => Value::from_bool_value(compiler.builder.build_int_compare(
            inkwell::IntPredicate::ULT,
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_cmp_ult",
        )),
        "int_cmp_ugt" => Value::from_bool_value(compiler.builder.build_int_compare(
            inkwell::IntPredicate::UGT,
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_cmp_ugt",
        )),
        "int_cmp_ule" => Value::from_bool_value(compiler.builder.build_int_compare(
            inkwell::IntPredicate::ULE,
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_cmp_ule",
        )),
        "int_cmp_uge" => Value::from_bool_value(compiler.builder.build_int_compare(
            inkwell::IntPredicate::UGE,
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_cmp_uge",
        )),
        "int_cmp_neq" => Value::from_bool_value(compiler.builder.build_int_compare(
            inkwell::IntPredicate::NE,
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_cmp_eq",
        )),
        "raw_store_in" => {
            compiler.builder.build_store(
                variables[0].into_ptr_value(),
                variables[1].get_basic_value(),
            );
            Value::void_value(compiler.compiler.read().unwrap().context)
        }
        "ptr_to_int" => Value::from_int_value(compiler.builder.build_ptr_to_int(
            variables[0].into_ptr_value(),
            compiler.compiler.read().unwrap().context.i64_type(),
            "ptr_to_int",
        )),
        "int_to_int_ptr" => Value::from(
            compiler
                .builder
                .build_int_to_ptr(
                    variables[0].into_int_value(),
                    compiler
                        .compiler
                        .read()
                        .unwrap()
                        .context
                        .custom_width_int_type(1)
                        .ptr_type(inkwell::AddressSpace::Generic),
                    "tmp_ptr_cast",
                )
                .as_basic_value_enum(),
            CompilerType {
                underlying: compiler
                    .compiler
                    .read()
                    .unwrap()
                    .context
                    .custom_width_int_type(1)
                    .ptr_type(inkwell::AddressSpace::Generic)
                    .as_any_type_enum(),
                ty: crate::value::TypeEnum::PointerType(Box::new(CompilerType::new(
                    compiler
                        .compiler
                        .read()
                        .unwrap()
                        .context
                        .custom_width_int_type(1)
                        .as_any_type_enum(),
                    crate::value::TypeEnum::IntType,
                ))),
            },
        ),
        "single_gep" => unsafe {
            compile_gep(
                compiler,
                variables[0].clone(),
                variables[1].clone(),
                error_at,
            )?
        },
        "int_and" => Value::from_int_value(compiler.builder.build_and(
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_and",
        )),
        "int_or" => Value::from_int_value(compiler.builder.build_or(
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_or",
        )),
        "int_not" => Value::from_int_value(
            compiler
                .builder
                .build_not(variables[0].into_int_value(), "asm_int_not"),
        ),
        "bool_and" => Value::from_bool_value(compiler.builder.build_and(
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_bool_and",
        )),
        "bool_or" => Value::from_bool_value(compiler.builder.build_or(
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_bool_or",
        )),
        "bool_not" => Value::from_bool_value(
            compiler
                .builder
                .build_not(variables[0].into_int_value(), "asm_bool_not"),
        ),
        "int_mul" => Value::from_int_value(compiler.builder.build_int_mul(
            variables[0].into_int_value(),
            variables[1].into_int_value(),
            "asm_int_mul",
        )),
        unknown => {
            return Err(CompilationError::new(
                format!("Unknown opcode {}", unknown),
                error_at,
            ))
        }
    };
    Ok(r)
}

unsafe fn compile_gep<'a>(
    compiler: CompilerInstance<'a>,
    obj: Value<'a>,
    index: Value<'a>,
    error_at: LexString<'a>,
) -> CompilationResult<'a> {
    let ty = match obj.ty.ty {
        crate::value::TypeEnum::PointerType(ref ptr) => ptr,
        _ => {
            return Err(CompilationError::new(
                format!("Cannot GEP into {:?}", obj),
                error_at,
            ))
        }
    };

    /*     if compiler.do_var_as_ptr { */
    Ok(Value::from(
        compiler
            .builder
            .build_in_bounds_gep(obj.into_ptr_value(), &[index.into_int_value()], "asm_gep")
            .as_basic_value_enum(),
        obj.ty,
    ))
    // } else {
    //     Ok(Value::from(compiler.builder.build_load(compiler.builder.build_gep(obj.into_ptr_value(), &[index.into_int_value()], "asm_gep"), "asm_gep_load"), *ty.clone()))
    // }
}
