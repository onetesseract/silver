use parser::syntax::while_loop::WhileLoop;

use super::{CompilerInstance, CompilationError, expr_codegen};

pub fn compile_while_loop<'a>(expr: WhileLoop<'a>, compiler: CompilerInstance<'a>) -> Result<(), CompilationError<'a>> {
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

    let cond = match cond {
        Some(inkwell::values::BasicValueEnum::IntValue(iv)) => iv,
        _ => return Err(CompilationError::new(format!("Cannot use {:?} as a true/false condition", expr.condition), expr.raw)),
    };

    compiler.builder.build_conditional_branch(cond, body_block, cont_block);

    // we done with checking condition, now compile the body
    compiler.builder.position_at_end(cont_block);
    expr_codegen(expr.body, compiler.clone())?;

    // back to the top
    compiler.builder.build_unconditional_branch(cond_check_block);

    // now lets put the builder where it should be
    compiler.builder.position_at_end(cont_block);

    Ok(())
}
