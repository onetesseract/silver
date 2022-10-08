use inkwell::{
    types::{AnyType, BasicMetadataTypeEnum},
    values::{BasicMetadataValueEnum, BasicValue, CallableValue},
};
use parser::syntax::{call::CallExpr, proto::FnType, ExprVal};

use crate::{
    syntax::{vardef::compile_vardef, TargetType},
    value::{CompilerType, TypeEnum, Value},
};

use super::{
    expr_codegen, template::compile_fn_template, ty::compile_basic_type,
    vardef::entry_block_alloca, variable::compile_variable, CompilationError, CompilationResult,
    CompilerInstance,
};

pub fn compile_call<'a>(
    expr: CallExpr<'a>,
    compiler: CompilerInstance<'a>,
) -> CompilationResult<'a> {
    compiler.compiler.try_write().unwrap();

    // TODO: allow overriding & and * fns

    if matches!(expr.calltype, FnType::Prefix | FnType::Normal) {
        if let parser::syntax::call::TargetType::Named(ref n) = expr.target {
            if n.name.render() == "*" {
                let value = expr_codegen(expr.inputs[0].clone(), compiler.clone())?;
                match value.ty.ty.clone() {
                    crate::value::TypeEnum::PointerType(target_ty) => {
                        return Ok(Value::from(
                            compiler.builder.build_load(
                                value.get_basic_value().into_pointer_value(),
                                "deref_load",
                            ),
                            *target_ty,
                        ))
                    }
                    _ => {
                        return Err(CompilationError::new(
                            format!("Cannot deref a {:?}", expr),
                            expr.target.get_location(),
                        ))
                    }
                }
            }
        }
        if let parser::syntax::call::TargetType::Named(ref n) = expr.target {
            if n.name.render() == "&" {
                match &*expr.clone().inputs[0].val {
                    ExprVal::Variable(v) => {
                        let mut compiler = compiler;
                        compiler.do_var_as_ptr = true;
                        return Ok(compile_variable(v.clone(), compiler)?);
                    }
                    ExprVal::Call(ref call) => {
                        if let parser::syntax::call::TargetType::Named(n) = &call.target {
                            if n.name.render() == "." {
                                let mut compiler = compiler;
                                compiler.do_var_as_ptr = true;
                                return compile_call(call.clone(), compiler);
                            }
                        }
                    }
                    _ => {}
                }
                let val = expr_codegen(expr.inputs[0].clone(), compiler.clone())?;
                println!("Val 0th: {:#?} aaaa\n {:#?}", expr.inputs[0], val);
                let space = entry_block_alloca(
                    val.get_basic_type().unwrap(),
                    compiler.clone(),
                    "deref_space".to_string(),
                );
                compiler.builder.build_store(space, val.get_basic_value());

                let val = Value::from(
                    space.as_basic_value_enum(),
                    CompilerType::new_ptr_to(val.ty, space.get_type().as_any_type_enum()),
                );

                return Ok(val);
            }
        }
    }
    if let FnType::Infix = expr.calltype {
        if let parser::syntax::call::TargetType::Named(ref n) = expr.target {
            if n.name.render() == "." {
                // boiiiii
                match &*expr.inputs[1].val {
                    ExprVal::Variable(var) => {
                        let mut compiler_ = compiler.clone();
                        compiler_.do_var_as_ptr = false;
                        let parent = expr_codegen(expr.inputs[0].clone(), compiler_.clone())?;
                        // compiler_.do_var_as_ptr = false;
                        let st = match parent.ty.ty {
                            TypeEnum::PointerType(ref x) => match &x.ty {
                                TypeEnum::StructType(st) => st,
                                _ => {
                                    return Err(CompilationError::new(
                                        format!("Cannot struct-access into a {:?}", expr),
                                        expr.target.get_location(),
                                    ))
                                }
                            },
                            _ => {
                                return Err(CompilationError::new(
                                    format!("Cannot struct-access into a {:?}", expr),
                                    expr.target.get_location(),
                                ))
                            }
                        };

                        let mut index: isize = -1;
                        let mut elem_ty = None;
                        for (internal_index, (name, ty)) in st.values.iter().enumerate() {
                            println!("Trying `{}` against `{}`", name.render(), var.name.render());
                            if name.render() == var.name.render() {
                                index = internal_index.try_into().unwrap();
                                elem_ty = Some(ty);
                                break;
                            }
                        }

                        if index == -1 {
                            return Err(CompilationError::new(
                                format!(
                                    "Cannot find sub-value {} in {:?}\nstruct is {:?}",
                                    var.name.render(),
                                    expr,
                                    st
                                ),
                                expr.target.get_location(),
                            ));
                        }

                        let x = compiler
                            .builder
                            .build_struct_gep(
                                parent.into_ptr_value(),
                                index.try_into().unwrap(),
                                "struct_gep",
                            )
                            .unwrap();

                        if compiler.do_var_as_ptr {
                            return Ok(Value::from(
                                x.as_basic_value_enum(),
                                CompilerType::new_ptr_to(
                                    CompilerType {
                                        ty: elem_ty.unwrap().clone(),
                                        underlying: x.get_type().as_any_type_enum(),
                                    },
                                    x.get_type().as_any_type_enum(),
                                ),
                            ));
                        } else {
                            let load = compiler.builder.build_load(x, "struct_gep_deref");

                            return Ok(Value::from(
                                load,
                                CompilerType {
                                    ty: elem_ty.unwrap().clone(),
                                    underlying: load.get_type().as_any_type_enum(),
                                },
                            ));
                        }
                    }
                    ExprVal::Call(call) => {
                        let mut call = call.clone();
                        call.inputs.insert(0, expr.inputs[0].clone());
                        return compile_call(call.clone(), compiler);
                    }
                    _ => {
                        return Err(CompilationError::new(
                            format!("Cannot struct-access into a {:?}", expr),
                            expr.target.get_location(),
                        ))
                    }
                }
            }
        }
    }

    compiler.compiler.try_write().unwrap();

    println!("call");

    let read = compiler.compiler.clone();
    let read = read.read().unwrap();

    if let Some((proto_, body_)) = read
        .global_macros
        .get(&(TargetType::from(expr.target.clone()), expr.calltype))
    {
        let proto = proto_.clone();
        let body = body_.clone();
        drop(proto_);
        drop(body_);
        drop(read);
        compiler.compiler.try_write().unwrap();
        println!("MACRO");
        // hoo boy its a macro
        if proto.args.len() != expr.inputs.len() {
            return Err(CompilationError::new(
                format!(
                    "Expected {} args for macro but got {}",
                    proto.args.len(),
                    expr.inputs.len()
                ),
                proto.name.get_location(),
            ));
        }
        let mut compiler = compiler.clone();
        // compiler.do_var_as_ptr = true;
        let mut locals = compiler.local_variables.read().unwrap().clone();
        for (index, i) in expr.inputs.iter().enumerate() {
            // println!("Handling {:?} as {}", i, proto.args[index].varname.render());
            if let ExprVal::Variable(v) = &*i.val {
                compiler.do_var_as_ptr = true;
                let var = compile_variable(v.clone(), compiler.clone())?;
                locals.vars.insert(proto.args[index].varname.render(), var);
                compiler.do_var_as_ptr = false;
                continue;
            } else if let ExprVal::Call(c) = &*i.val {
                if let TargetType::Named(n) = TargetType::from(c.target.clone()) {
                    if n == "." && matches!(&*c.inputs[1].val, ExprVal::Variable(_)) {
                        compiler.do_var_as_ptr = true;
                        let call = compile_call(c.clone(), compiler.clone())?;
                        compiler.do_var_as_ptr = false;
                        locals.vars.insert(proto.args[index].varname.render(), call);
                        continue;
                    }
                }
            } else if let ExprVal::VarDef(v) = &*i.val {
                let var = compile_vardef(v.clone(), compiler.clone())?;
                locals.vars.insert(proto.args[index].varname.render(), var);
                continue;
            }
            let expr = expr_codegen(i.clone(), compiler.clone())?;
            let space = entry_block_alloca(
                expr.get_basic_type().unwrap(),
                compiler.clone(),
                "macro_arg_space".to_string(),
            );
            compiler.builder.build_store(space, expr.get_basic_value());
            let value = Value::from(
                space.as_basic_value_enum(),
                CompilerType::new_ptr_to(expr.ty, space.get_type().as_any_type_enum()),
            );
            println!(
                "Default-adding variable {}",
                proto.args[index].varname.render()
            );
            locals
                .vars
                .insert(proto.args[index].varname.render(), value);
        }
        compiler.do_var_as_ptr = false;

        let original = compiler.local_variables.read().unwrap().clone();

        compiler.local_variables.write().unwrap().vars = locals.vars;

        // println!("LOCALS: {:#?}", compiler.local_variables.write().unwrap().vars);

        compiler.compiler.try_write().unwrap();

        let res = expr_codegen(body.clone(), compiler.clone())?;
        compiler.local_variables.write().unwrap().vars = original.vars;
        return Ok(res);
    }

    drop(read);

    // let compiler = compiler;
    let mut compiler = compiler;
    compiler.do_var_as_ptr = false;

    let mut inputs = vec![];
    for i in expr.inputs {
        let val = expr_codegen(i, compiler.clone())?;
        inputs.push(match val.is_void() {
            false => val,
            true => {
                return Err(CompilationError::new(
                    format!("Cannot use a void value as a call arg"),
                    expr.target.get_location(),
                ))
            }
        })
    }

    let argsv: Vec<BasicMetadataValueEnum> = inputs
        .iter()
        .by_ref()
        .map(|val| val.get_basic_value().into())
        .collect();
    // TODO: feels hacky
    let args_types: Vec<BasicMetadataTypeEnum> = inputs
        .iter()
        .by_ref()
        .map(|val| val.get_basic_value().get_type().into())
        .collect();
    // let basic_types: Vec<BasicTypeEnum> = inputs.iter().map(|val| val.get_basic_value().get_type()).collect();
    // let types = inputs.iter().map(|val| val.ty.clone()).collect();

    println!("args_types: {:?}", args_types);

    let read = compiler.compiler.read().unwrap();

    let (mut target, mut target_ty) = match read
        .global_overloadables
        .get(&TargetType::from(expr.target.clone()))
    {
        Some(s) => {
            let mut ret = (None, None);
            for (k, val, ty) in s {
                if args_types == *k {
                    ret = (Some(*val), Some(ty.clone())); // uhh
                    break;
                }
            }
            ret
        }
        None => (None, None),
    };

    // let mut target = target.clone();

    drop(read);

    if !target.is_some() {
        // TODO: check this logic
        // compiler.do_var_as_ptr = true;
        let mut targ = (None, None);
        if let parser::syntax::call::TargetType::Named(ref n) = expr.target {
            println!("Finding fn as variable {}", n.name.render());
            compiler.do_var_as_ptr = true;
            let var = compile_variable(n.clone(), compiler.clone());
            compiler.do_var_as_ptr = false;
            println!("Done");
            // compiler.do_var_as_ptr = false;
            targ = match var {
                Ok(s) => (Some(s.into_ptr_value()), Some(s.ty)),
                Err(_) => (None, None),
            };
        }

        if targ.0.is_none() {
            targ = match expr.types {
                Some(_) => {
                    let contains: bool = compiler
                        .compiler
                        .read()
                        .unwrap()
                        .global_fn_templates
                        .contains_key(&TargetType::from(expr.target.clone()));

                    if contains {
                        let mut types = vec![];
                        for i in expr.types.unwrap() {
                            types.push(compile_basic_type(i, compiler.clone())?);
                        }
                        let template_fn = compile_fn_template(
                            TargetType::from(expr.target.clone()),
                            types,
                            compiler.clone(),
                        )?;
                        (
                            Some(template_fn.0.as_global_value().as_pointer_value()),
                            Some(template_fn.1),
                        )
                    } else {
                        return Err(CompilationError::new(
                            format!("Unable to find function {:?}", expr.target),
                            expr.target.get_location(),
                        ));
                    }
                }
                None => {
                    // println!("Current fns: {:#?}", compiler.compiler.read().unwrap().global_overloadables);
                    return Err(CompilationError::new(format!("Fell back to templating but no type params exist! You sure the function `{:?}` exists?", expr.target), expr.target.get_location()));
                }
            }
        }

        target = targ.0;
        target_ty = targ.1;
    }

    let target = target.unwrap();

    let target = match CallableValue::try_from(target) {
        Ok(s) => s,
        Err(e) => {
            return Err(CompilationError::new(
                format!(
                    "Cannot call {:?}, is it a function? (error {:?})",
                    expr.target, e
                ),
                expr.target.get_location(),
            ))
        }
    };

    let call = compiler
        .builder
        .build_call(
            target,
            argsv.as_slice(),
            format!("{:?}_call", expr.target.clone()).as_str(),
        )
        .try_as_basic_value();

    if call.is_left() {
        Ok(Value::from(call.left().unwrap(), target_ty.unwrap()))
    } else {
        Ok(Value::void_value(compiler.compiler.read().unwrap().context))
    }
}
