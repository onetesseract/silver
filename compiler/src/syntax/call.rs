use inkwell::{values::{BasicMetadataValueEnum, CallableValue}, types::{BasicMetadataTypeEnum, BasicTypeEnum}};
use parser::syntax::call::CallExpr;

use crate::value::Value;

use super::{CompilerInstance, CompilationError, variable::compile_variable, expr_codegen, template::compile_fn_template, CompilationResult};

pub fn compile_call<'a>(expr: CallExpr<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    let mut compiler = compiler;

    let mut inputs = vec![];
    for i in expr.inputs {
        let val = expr_codegen(i, compiler.clone())?;
        inputs.push(match val.is_void() {
            false => val,
            true => return Err(CompilationError::new(format!("Cannot use a void value as a call arg"), expr.target.name)),
        })
    }

    let argsv: Vec<BasicMetadataValueEnum> = inputs.iter().by_ref().map(|val| val.get_basic_value().into()).collect();
    // TODO: feels hacky
    let args_types: Vec<BasicMetadataTypeEnum> = inputs.iter().by_ref().map(|val| val.get_basic_value().get_type().into()).collect();
    let basic_types: Vec<BasicTypeEnum> = inputs.iter().map(|val| val.get_basic_value().get_type()).collect();
    // let types = inputs.iter().map(|val| val.ty.clone()).collect();


    let read = compiler.compiler.read().unwrap();

    let (mut target, mut target_ty) = match read.global_overloadables.get(expr.target.name.render()) {
        Some(s) => {
            let mut ret = (None, None);
            for (k, val, ty) in s {
                if args_types == *k {
                    ret = (Some(*val), Some(ty.clone()));
                    break;
                }
            }
            ret
        },
        None => (None, None),
    };

    // let mut target = target.clone();

    drop(read);

    if !target.is_some() {
        compiler.do_var_as_ptr = true;
        let var = compile_variable(expr.target.clone(), compiler.clone());
        compiler.do_var_as_ptr = false;  
        let targ = match var {
            Ok(s) => (Some(s.into_ptr_value()), Some(s.ty)),
            Err(_) => match expr.types {
                Some(s) => todo!("types for overloaded or FnVal")/* match compiler.compiler.read().unwrap().global_fn_templates.contains_key(expr.target.name.render()) {
                    true => compile_fn_template(expr.target.name.clone(), types, compiler.clone())?.as_global_value().as_pointer_value(),
                    false => return Err(CompilationError::new(format!("Unable to find function {}", expr.target.name.render()), expr.target.name)),
                } */,
                None => {
                    return Err(CompilationError::new(format!("Fell back to templating but no type params exist! You sure the function `{}` exists?", expr.target.name.render()), expr.target.name));
                }
            }
        };
        target = targ.0;
        target_ty = targ.1;
    }

    let target = target.unwrap(); 

    let target = match CallableValue::try_from(target) {
        Ok(s) => s,
        Err(e) => return Err(CompilationError::new(format!("Cannot call {}, is it a function? (error {:?})", expr.target.name.render(), e), expr.target.name)),
    };

    let call = compiler.builder.build_call(target, argsv.as_slice(), format!("{}_call", expr.target.name.render()).as_str()).try_as_basic_value();

    if call.is_left() {
        Ok(Value::from(call.left().unwrap(), target_ty.unwrap()))
    } else {
        Ok(Value::void_value(compiler.compiler.read().unwrap().context))
    }
}
