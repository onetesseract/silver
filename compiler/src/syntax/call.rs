use inkwell::{values::{BasicValueEnum, BasicMetadataValueEnum, CallableValue}, types::{BasicMetadataTypeEnum, BasicTypeEnum}};
use parser::syntax::call::CallExpr;

use super::{CompilerInstance, CompilationError, variable::compile_variable, expr_codegen, template::compile_fn_template};

fn dummyfn() {
    panic!()}

pub fn compile_call<'a>(expr: CallExpr<'a>, compiler: CompilerInstance<'a>) -> Result<Option<BasicValueEnum<'a>>, CompilationError<'a>> {
    let mut compiler = compiler;
    
    println!("c: {:#?}", compiler);
    // compiler.do_var_as_ptr = false;

    let mut inputs = vec![];
    for i in expr.inputs {
        inputs.push(match expr_codegen(i, compiler.clone())? {
            Some(s) => s,
            None => return Err(CompilationError::new(format!("Cannot use a nil value as a call arg"), expr.target.name)),
        })
    }

    let argsv: Vec<BasicMetadataValueEnum> = inputs.iter().by_ref().map(|&val| val.into()).collect();
    let args_types: Vec<BasicMetadataTypeEnum> = inputs.iter().by_ref().map(|&val| val.get_type().into()).collect();
    let basic_types: Vec<BasicTypeEnum> = inputs.iter().map(|val| val.get_type()).collect();


    let read = compiler.compiler.read().unwrap();

    let target = match read.global_overloadables.get(expr.target.name.render()) {
        Some(s) => {
            let mut ret = None;
            for (k, val) in s {
                if args_types == *k {
                    ret = Some(*val);
                    break;
                }
            }
            ret
        },
        None => None,
    };

    println!("here");

    let mut target = target.clone();

    drop(read);

    if !target.is_some() {
        target = Some(match {compiler.do_var_as_ptr = true; let r = compile_variable(expr.target.clone(), compiler.clone()); compiler.do_var_as_ptr = false; r} {
            Ok(s) => s.into_pointer_value(),
            Err(_) => match expr.types {
                Some(s) => match compiler.compiler.read().unwrap().global_fn_templates.contains_key(expr.target.name.render()) {
                    true => compile_fn_template(expr.target.name.clone(), basic_types.clone(), compiler.clone())?.as_global_value().as_pointer_value(),
                    false => return Err(CompilationError::new(format!("Unable to find function {}", expr.target.name.render()), expr.target.name)),
                },
                None => {
                    return Err(CompilationError::new(format!("Fell back to templating but no type params exist! You sure the function `{}` exists?", expr.target.name.render()), expr.target.name));
                }
            }
        });
    }

    let target = target.unwrap(); // match target.clone() {
    //     Some(s) => s,
    //     None => match {compiler.do_var_as_ptr = true; let r = compile_variable(expr.target.clone(), compiler.clone()); compiler.do_var_as_ptr = false; r} {
    //         Ok(s) => s.into_pointer_value(),
    //         Err(_) => match expr.types {
    //             Some(s) => match compiler.compiler.read().unwrap().global_fn_templates.contains_key(expr.target.name.render()) {
    //                 true => compile_fn_template(expr.target.name.clone(), basic_types, compiler.clone())?.as_global_value().as_pointer_value(),
    //                 false => return Err(CompilationError::new(format!("Unable to find function {}", expr.target.name.render()), expr.target.name)),
    //             },
    //             None => {
    //                 println!("{:#?}", compiler);
    //                 println!("{:#?}", args_types);
    //                 return Err(CompilationError::new(format!("Fell back to templating but no type params exist! You sure the function `{}` exists?", expr.target.name.render()), expr.target.name))
    //             }
    //         }
    //     },
    // };

    println!("there");


    let target = match CallableValue::try_from(target) {
        Ok(s) => s,
        Err(e) => return Err(CompilationError::new(format!("Cannot call {}, is it a function? (error {:?})", expr.target.name.render(), e), expr.target.name)),
    };
    println!("there2");

    let call = compiler.builder.build_call(target, argsv.as_slice(), format!("{}_call", expr.target.name.render()).as_str()).try_as_basic_value();

    println!("there2");

    if compiler.function.unwrap().get_name().to_str().unwrap() == "templatable" { 
        // dummyfn();
    }

    if call.is_left() {
        Ok(Some(call.left().unwrap()))
    } else {
        Ok(None)
    }
}
