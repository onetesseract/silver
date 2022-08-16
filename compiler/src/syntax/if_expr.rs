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
    // let then_pickup_block = compiler.compiler.read().unwrap().context.append_basic_block(compiler.function.unwrap(), "if_then_pickup_block");


    // do we need an else block?
    let else_block = match expr.els {
        Some(_) => Some(compiler.compiler.read().unwrap().context.append_basic_block(compiler.function.unwrap(), "if_else_block"))/* , Some(compiler.compiler.read().unwrap().context.append_basic_block(compiler.function.unwrap(), "if_else_pickup_block")) */,
        None => None,
    };

    // and the continuation block
    let other_cont_block = compiler.cont_block.is_some();
    let cont_block = if let Some(block) = compiler.cont_block {
        block
    } else {
        compiler.compiler.read().unwrap().context.append_basic_block(compiler.function.unwrap(), "if_cont_block")
    };
    if let Some(else_block) = else_block {
        compiler.builder.build_conditional_branch(cond, then_block, else_block);
    } else {
        compiler.builder.build_conditional_branch(cond, then_block, cont_block);
    }

    // now we compile the first expr
    compiler.builder.position_at_end(then_block);

    // let compiler_prev = compiler.clone(); // preserve a possible return_to

    let mut compiler = compiler;

    // compiler.cont_block = Some(cont_block);

    // compiler.return_to_this_block = Some(then_pickup_block);

    let then_val = expr_codegen(expr.then, compiler.clone())?;

    // compiler.return_to_this_block = None;

    let then_bb = compiler.builder.get_insert_block().unwrap();


    compiler.builder.build_unconditional_branch(cont_block);


    // compiler.builder.position_at_end(then_block);
    // back to continuation
    // compiler.builder.build_unconditional_branch(then_pickup_block);
    //
    // // bring pickup to cont
    // compiler.builder.position_at_end(then_pickup_block);
    // compiler.builder.build_unconditional_branch(cont_block);

    let (else_val, else_bb) = if let Some(else_expr) = expr.els {
        compiler.builder.position_at_end(else_block.unwrap());
        // compiler.return_to_this_block = Some(else_pickup_block.unwrap());
        let else_val = expr_codegen(else_expr, compiler.clone())?;

        compiler.builder.build_unconditional_branch(cont_block);
        // compiler.return_to_this_block = None;
        // compiler.builder.position_at_end(else_block.unwrap());
        // compiler.builder.build_unconditional_branch(else_pickup_block.unwrap());
        // compiler.builder.position_at_end(else_pickup_block.unwrap());
        // compiler.builder.build_unconditional_branch(cont_block);
        (else_val, Some(compiler.builder.get_insert_block().unwrap()))
    } else {
        (Value::void_value(compiler.compiler.read().unwrap().context), None)
    };

    compiler.builder.position_at_end(cont_block);

    // time for phi!
    if let Some(_) = else_val.value {
        if let Some(ref tv) = then_val.value {
            if else_val.ty == then_val.ty {
                let phi = compiler.builder.build_phi(tv.value.get_type(), "if_phi");
                phi.add_incoming(&[
                    (&then_val.get_basic_value(), then_bb),
                    (&else_val.clone().get_basic_value(), else_bb.unwrap())
                ]);
                return Ok(Value::from(phi.as_basic_value(), CompilerType::new(phi.as_basic_value().get_type().as_any_type_enum(), then_val.ty.ty)))
            } else {
                return Err(CompilationError::new(format!("Mismatched types, expected {:?} twice but second is {:?}", then_val.ty, else_val.ty), expr.raw));
            }
        }
    }

    // if let Some(block) = compiler_prev.return_to_this_block {
    //     compiler.builder.build_unconditional_branch(block);
    // }

    return Ok(Value::void_value(compiler.compiler.read().unwrap().context));
}
