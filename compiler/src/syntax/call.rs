use inkwell::{values::{BasicMetadataValueEnum, CallableValue, BasicValue}, types::{BasicMetadataTypeEnum, AnyType}};
use parser::syntax::{call::{CallExpr, CallType}, ExprVal};

use crate::value::{Value, CompilerType, TypeEnum};

use super::{CompilerInstance, CompilationError, variable::compile_variable, expr_codegen, CompilationResult, template::compile_fn_template, ty::compile_basic_type};

pub fn compile_call<'a>(expr: CallExpr<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    // TODO: allow overriding & and * fns
    
    if matches!(expr.calltype, CallType::Prefix | CallType::Normal) {
        if expr.target.name.render() == "*" {
            let value = expr_codegen(expr.inputs[0].clone(), compiler.clone())?;
            match value.ty.ty.clone() {
                crate::value::TypeEnum::PointerType(target_ty) => return Ok(Value::from(compiler.builder.build_load(value.get_basic_value().into_pointer_value(), "deref_load"), *target_ty)),
                _ => return Err(CompilationError::new(format!("Cannot deref a {:?}", expr), expr.target.name))
            }
        }
        if expr.target.name.render() == "&" {
            // compiler.do_var_as_ptr = true;
            return expr_codegen(expr.clone().inputs[0].clone(), compiler);

            // match &*expr.clone().inputs[0].val {
            //     ExprVal::Variable(v) => {
            //         let mut compiler = compiler;
            //         compiler.do_var_as_ptr = true;
            //         return Ok(compile_variable(v.clone(), compiler)?);
            //     },
            //     _ => {
            //         let val = expr_codegen(expr.inputs[0].clone(), compiler.clone())?;
            //         let space = entry_block_alloca(val.get_basic_type().unwrap(), compiler.clone(), "deref_space");
            //         compiler.builder.build_store(space, val.get_basic_value());
            //
            //         let val = Value::from(space.as_basic_value_enum(), CompilerType::new_ptr_to(val.ty, space.get_type().as_any_type_enum()));
            //
            //         return Ok(val);
            //     }
            // }
        }
    }
    if let CallType::Infix = expr.calltype {
        if expr.target.name.render() == "." {
            // boiiiii
            match &*expr.inputs[1].val {
                ExprVal::Variable(var) => {
                    let compiler_ = compiler.clone();
                    // compiler_.do_var_as_ptr = true;
                    let parent = expr_codegen(expr.inputs[0].clone(), compiler_.clone())?;
                    // compiler_.do_var_as_ptr = false;
                    let st = match parent.ty.ty {
                        TypeEnum::PointerType(ref x) => {
                            match &x.ty {
                                TypeEnum::StructType(st) => st,
                                _ => return Err(CompilationError::new(format!("Cannot struct-access into a {:?}", expr), expr.target.name)),
                            }
                        },
                        _ => return Err(CompilationError::new(format!("Cannot struct-access into a {:?}", expr), expr.target.name)),
                    };

                    let mut index: isize = -1;
                    let mut elem_ty = None;
                    for (internal_index, (name, ty)) in st.values.iter().enumerate() {
                        if name.render() == var.name.render() {
                            index = internal_index.try_into().unwrap();
                            elem_ty = Some(ty);
                            break;
                        }
                    }

                    if index == -1 {
                        return Err(CompilationError::new(format!("Cannot find sub-value {} in {:?}", var.name.render(), expr), expr.target.name));
                    }

                    let x = compiler.builder.build_struct_gep(parent.into_ptr_value(), index.try_into().unwrap(), "struct_gep").unwrap();

                    // if compiler.do_var_as_ptr {
                        return Ok(Value::from(x.as_basic_value_enum(), CompilerType::new_ptr_to(CompilerType {ty: elem_ty.unwrap().clone(), underlying: x.get_type().as_any_type_enum()}, x.get_type().as_any_type_enum())))
                    // } else {
                    //     let load = compiler.builder.build_load(x, "struct_gep_deref");
                    //
                    //     return Ok(Value::from(load, CompilerType {ty: elem_ty.unwrap().clone(), underlying: load.get_type().as_any_type_enum()}))
                    // }
                },
                ExprVal::Call(call) => {
                    let mut call = call.clone();
                    call.inputs.insert(0, expr.inputs[0].clone());
                    return compile_call(call.clone(), compiler);
                },
                _ => return Err(CompilationError::new(format!("Cannot struct-access into a {:?}", expr), expr.target.name))
            }
        }
    }

    let compiler = compiler;

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
    // let basic_types: Vec<BasicTypeEnum> = inputs.iter().map(|val| val.get_basic_value().get_type()).collect();
    // let types = inputs.iter().map(|val| val.ty.clone()).collect();

    let read = compiler.compiler.read().unwrap();

    let (mut target, mut target_ty) = match read.global_overloadables.get(expr.target.name.render().as_str()) {
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
        // compiler.do_var_as_ptr = true;
        let var = compile_variable(expr.target.clone(), compiler.clone());
        // compiler.do_var_as_ptr = false;  
        let targ = match var {
            Ok(s) => (Some(s.into_ptr_value()), Some(s.ty)),
            Err(_) => match expr.types {
                Some(_) => {
                    if compiler.compiler.read().unwrap().global_fn_templates.contains_key(expr.target.name.render().as_str()) {
                        let mut types = vec![];
                        for i in expr.types.unwrap() {
                            types.push(compile_basic_type(i, compiler.clone())?);
                        }
                        let template_fn = compile_fn_template(expr.target.name.clone(), types, compiler.clone())?;
                        (Some(template_fn.0.as_global_value().as_pointer_value()), Some(template_fn.1))
                    } else {
                        return Err(CompilationError::new(format!("Unable to find function {}", expr.target.name.render()), expr.target.name))
                    }
                },
                None => {
                    // println!("Current fns: {:#?}", compiler.compiler.read().unwrap().global_overloadables);
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
