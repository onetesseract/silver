use std::sync::{Arc, RwLock};

use inkwell::{types::BasicTypeEnum, values::FunctionValue};
use parser::lexer::LexString;

use crate::syntax::CompilerInternal;

use super::{CompilationError, CompilerInstance, compile_fn};

pub fn compile_fn_template<'a>(name: LexString<'a>, types: Vec<BasicTypeEnum<'a>>, compiler: CompilerInstance<'a>) -> Result<FunctionValue<'a>, CompilationError<'a>> {
    if !compiler.compiler.read().unwrap().global_fn_templates.contains_key(name.render()) {
        return Err(CompilationError::new(format!("Unable to find template function {}", name.render()), name))
    }

    // TODO: given that we already store overloads, do we needc this caching?
    match compiler.compiler.read().unwrap().global_cached_fn_templates.get(name.render()) {
        Some(s) => {
            let mut fn_cached = None; // GOT HERE
            for (args, fv) in s {
                if args == &types {
                    fn_cached = Some(fv);
                    break;
                }
            }
            if let Some(s) = fn_cached {
                return Ok(*s);
            }
        }
        None => {},
    }

    // TODO: elegant and smart restriction testing
    
    let read = compiler.compiler.read().unwrap();
    
    let template = read.global_fn_templates.get(name.render()).unwrap();

    let proto = template.proto.clone();
    let body = template.body.clone();
    let hints = template.hints.clone();

    let params = template.template.clone().unwrap().params;

    if params.len() != types.len() {
        return Err(CompilationError::new(format!("Expected {} type params but got {} for {}", params.len(), types.len(), name.render()), name));
    }

    let mut compiler = compiler.clone();

   

    println!("types {:?}", types);


    drop(read);

    // let old_read
    //
    let mut new_compiler_internal = CompilerInternal::new(compiler.compiler.read().unwrap().context, compiler.compiler.read().unwrap().module.clone());

    new_compiler_internal.global_variables = compiler.compiler.read().unwrap().global_variables.clone();
    new_compiler_internal.global_basic_types = compiler.compiler.read().unwrap().global_basic_types.clone();
    new_compiler_internal.global_fn_hints = compiler.compiler.read().unwrap().global_fn_hints.clone();
    new_compiler_internal.global_overloadables = compiler.compiler.read().unwrap().global_overloadables.clone();
    new_compiler_internal.global_fn_templates = compiler.compiler.read().unwrap().global_fn_templates.clone();

    let mut new_compiler = CompilerInstance::new(Arc::new(RwLock::new(new_compiler_internal)));

    for (index, val) in params.iter().enumerate() {
        new_compiler.local_basic_types.insert(val.name.ty.render(), types[index]);
    }

    let val = compile_fn(proto, body, hints, new_compiler, true)?;

    println!("hello");


    // match compiler.compiler.read().unwrap().global_cached_fn_templates.contains_key(name.render()) {
    //     true  => compiler.compiler.write().unwrap().global_cached_fn_templates.get_mut(name.render()).unwrap().push((types, val)),
    //     false => { println!("hi"); panic!(); compiler.compiler.write().unwrap().global_cached_fn_templates.insert(name.render(), vec![(types, val)]); println!("ayo"); },
    // }

    println!("ok on {}", name.render());

    Ok(val)
}
