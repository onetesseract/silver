use inkwell::values::BasicValueEnum;
use parser::syntax::if_expr::IfExpr;

use super::{CompilerInstance, CompilationError, expr_codegen};

pub fn compile_if<'a>(expr: IfExpr<'a>, compiler: CompilerInstance<'a>) -> Result<Option<BasicValueEnum<'a>>, CompilationError<'a>> {
    // first we compile the condition
    let cond = expr_codegen(expr.condition.clone(), compiler.clone())?;

    let cond = match cond {
        Some(inkwell::values::BasicValueEnum::IntValue(iv)) => iv,
        _ => return Err(CompilationError::new(format!("Cannot use {:?} as a true/false condition", expr.condition), expr.raw)),
    };

    

    // then we make the then-block
    let then_block = compiler.compiler.read().unwrap().context.append_basic_block(compiler.function.unwrap(), "if_then_block");

    // do we need an else block?
    let else_block = match expr.els {
        Some(_) => Some(compiler.compiler.read().unwrap().context.append_basic_block(compiler.function.unwrap(), "if_else_block")),
        None => None,
    };

    // and the continuation block
    let cont_block = compiler.compiler.read().unwrap().context.append_basic_block(compiler.function.unwrap(), "if_cont_block");

    if let Some(else_block) = else_block {
        compiler.builder.build_conditional_branch(cond, then_block, else_block);
    } else {
        compiler.builder.build_conditional_branch(cond, then_block, cont_block);
    }

    // now we compile the first expr
    compiler.builder.position_at_end(then_block);

    let then_val = expr_codegen(expr.then, compiler.clone())?;

    // back to continuation
    compiler.builder.build_unconditional_branch(cont_block);

    let else_val = if let Some(else_expr) = expr.els {
        compiler.builder.position_at_end(else_block.unwrap());
        let else_val = expr_codegen(else_expr, compiler.clone())?;
        compiler.builder.build_unconditional_branch(cont_block);
        else_val
    } else {
        None
    };

    compiler.builder.position_at_end(cont_block);

    // time for phi!
    if let Some(else_val) = else_val {
        if let Some(then_val) = then_val {
            if else_val.get_type() == then_val.get_type() {
                let phi = compiler.builder.build_phi(then_val.get_type(), "if_phi");
                phi.add_incoming(&[
                    (&then_val, then_block),
                    (&else_val, else_block.unwrap())
                ]);
                return Ok(Some(phi.as_basic_value()))
            } else {
                return Err(CompilationError::new(format!("Mismatched types, expected {:?} twice but second is {:?}", then_val.get_type(), else_val.get_type()), expr.raw));
            }
        }
    }

    return Ok(None);
}
