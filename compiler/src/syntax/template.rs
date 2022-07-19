use std::sync::{Arc, RwLock};

use inkwell::{types::{BasicTypeEnum, AnyType}, values::FunctionValue};

use crate::{syntax::{CompilerInternal, ty::compile_basic_type}, value::CompilerType};

use super::{CompilationError, CompilerInstance, compile_fn, TargetType};

pub fn compile_fn_template<'a>(name: TargetType, types: Vec<CompilerType<'a>>, compiler: CompilerInstance<'a>) -> Result<(FunctionValue<'a>, CompilerType<'a>), CompilationError<'a>> {
    if !compiler.compiler.read().unwrap().global_fn_templates.contains_key(&name) {
        return Err(CompilationError::new_anon(format!("Unable to find template function {:?}", name)))
    }

    let basic_types: Vec<BasicTypeEnum> = types.iter().map(|f| f.try_basic_type().unwrap()).collect();

    // TODO: given that we already store overloads, do we needc this caching?
    match compiler.compiler.read().unwrap().global_cached_fn_templates.get(&name) {
        Some(s) => {
            let mut fn_cached = None; // GOT HERE
            for (args, fv) in s {
                if args == &basic_types {
                    fn_cached = Some(fv);
                    break;
                }
            }
            if let Some(s) = fn_cached {
                return Ok(s.clone());
            }
        }
        None => {},
    }

    // TODO: elegant and smart restriction testing
    
    let read = compiler.compiler.read().unwrap();
    
    let template = read.global_fn_templates.get(&name).unwrap();

    let (proto, body) = match &template.tl {
        parser::syntax::Tl::Function(proto, body) => (proto.clone(), body.clone()),
        parser::syntax::Tl::Typedef(_, _) => todo!(),
        parser::syntax::Tl::CDef(_) => todo!(),
        parser::syntax::Tl::Enum(_) => todo!(),
    };

    let hints = template.hints.clone();

    let params = template.template.clone().unwrap().params;

    if params.len() != types.len() {
        return Err(CompilationError::new_anon(format!("Expected {} type params but got {} for {}", params.len(), types.len(), name.render())));
    }

    let compiler = compiler.clone();

    drop(read);

    let mut new_compiler_internal = CompilerInternal::new(compiler.compiler.read().unwrap().context, compiler.compiler.read().unwrap().module.clone());

    new_compiler_internal.global_variables = compiler.compiler.read().unwrap().global_variables.clone();
    new_compiler_internal.global_types = compiler.compiler.read().unwrap().global_types.clone();
    new_compiler_internal.global_fn_hints = compiler.compiler.read().unwrap().global_fn_hints.clone();
    new_compiler_internal.global_overloadables = compiler.compiler.read().unwrap().global_overloadables.clone();
    new_compiler_internal.global_fn_templates = compiler.compiler.read().unwrap().global_fn_templates.clone();
    new_compiler_internal.global_ty_templates = compiler.compiler.read().unwrap().global_ty_templates.clone();

    let mut new_compiler = CompilerInstance::new(Arc::new(RwLock::new(new_compiler_internal)));

    for (index, val) in params.iter().enumerate() {
        new_compiler.local_types.insert(val.clone().name, types[index].clone());
    }

    let val = compile_fn(proto.clone(), body, hints, new_compiler.clone(), true)?;

    let ret_ty = if let Some(s) = proto.return_ty {
        compile_basic_type(s, compiler.clone())?
    } else {
        CompilerType { ty: crate::value::TypeEnum::VoidType, underlying: compiler.compiler.read().unwrap().context.void_type().as_any_type_enum() }
    };

    drop(new_compiler);

    let b = compiler.compiler.read().unwrap().global_cached_fn_templates.contains_key(&name);

    if !b {
        compiler.compiler.write().unwrap().global_cached_fn_templates.insert(name.clone(), vec![]);
    }

    compiler.compiler.write().unwrap().global_cached_fn_templates.get_mut(&name).unwrap().push((basic_types, (val, ret_ty.clone())));

    Ok((val, ret_ty))
}
