use inkwell::types::AnyType;
use parser::syntax::if_expr::IfExpr;

use crate::value::{TypeEnum, Value, CompilerType};

use super::{CompilerInstance, CompilationError, expr_codegen, CompilationResult};

pub fn compile_if<'a>(expr: IfExpr<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    // first we compile the condition
    let cond = expr_codegen(expr.condition.clone(), compiler.clone())?;

    let cond = match cond.ty.ty {
        TypeEnum::BoolType => cond.into_int_value(),
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
        Value::void_value(compiler.compiler.read().unwrap().context)
    };

    compiler.builder.position_at_end(cont_block);

    // time for phi!
    if let Some(_) = else_val.value {
        if let Some(ref tv) = then_val.value {
            if else_val.ty == then_val.ty {
                let phi = compiler.builder.build_phi(tv.value.get_type(), "if_phi");
                phi.add_incoming(&[
                    (&then_val.get_basic_value(), then_block),
                    (&else_val.clone().get_basic_value(), else_block.unwrap())
                ]);
                return Ok(Value::from(phi.as_basic_value(), CompilerType::new(phi.as_basic_value().get_type().as_any_type_enum(), then_val.ty.ty)))
            } else {
                return Err(CompilationError::new(format!("Mismatched types, expected {:?} twice but second is {:?}", then_val.ty, else_val.ty), expr.raw));
            }
        }
    }

    return Ok(Value::void_value(compiler.compiler.read().unwrap().context));
}
