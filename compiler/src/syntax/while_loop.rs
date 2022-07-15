use parser::syntax::while_loop::WhileLoop;

use crate::value::{Value, TypeEnum};

use super::{CompilerInstance, CompilationError, expr_codegen, CompilationResult};

pub fn compile_while_loop<'a>(expr: WhileLoop<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    // we make a block
    let cond_check_block = compiler.compiler.read().unwrap().context.append_basic_block(compiler.function.unwrap(), "while_loop_cond_check_basic_block");
    // we enter the block
    compiler.builder.build_unconditional_branch(cond_check_block);
    compiler.builder.position_at_end(cond_check_block);

    // we make a body block
    let body_block = compiler.compiler.read().unwrap().context.append_basic_block(compiler.function.unwrap(), "while_loop_body_basic_block");

    // we make a continuation block
    let cont_block = compiler.compiler.read().unwrap().context.append_basic_block(compiler.function.unwrap(), "while_loop_cont_basic_block");

    // ok now evaulate the condition
    let cond = expr_codegen(expr.condition.clone(), compiler.clone())?;

    let cond = match cond.ty.ty {
        TypeEnum::BoolType => cond.into_int_value(),
        _ => return Err(CompilationError::new(format!("Cannot use {:?} as a true/false condition, it has type {:?}", expr.condition, cond.ty.ty), expr.raw)),
    };

    compiler.builder.build_conditional_branch(cond, body_block, cont_block);

    // we done with checking condition, now compile the body
    let mut compiler_ = compiler.clone();
    compiler_.break_to = Some(cont_block);
    compiler_.builder.position_at_end(body_block);
    expr_codegen(expr.body, compiler_)?;

    // back to the top
    compiler.builder.build_unconditional_branch(cond_check_block);

    // now lets put the builder where it should be
    compiler.builder.position_at_end(cont_block);

    Ok(Value::void_value(compiler.compiler.read().unwrap().context))
}
