use parser::{syntax::variable::VariableExpr, lexer::LexString};

use crate::value::{Value, TypeEnum};

use super::{CompilerInstance, CompilationError, CompilationResult};

pub fn compile_variable<'a>(expr: VariableExpr<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    compile_variable_name(expr.name.render().to_string(), compiler, expr.name)
}

pub fn compile_variable_name<'a>(name: String, compiler: CompilerInstance<'a>, err_at: LexString<'a>) -> CompilationResult<'a> {
    println!("Compiling var {}", name);
    let locals = compiler.local_variables.read().unwrap();
    let read = compiler.compiler.read().unwrap();
    let var = match locals.vars.get(name.as_str()) {
        Some(s) => s,
        None => match read.global_variables.get(name.as_str()) {
            Some(s) => s,
            None => {
                match read.global_consts.get(&name) {
                    Some(s) => {
                        if compiler.do_var_as_ptr {
                            panic!()
                        }
                        return Ok(s.clone());
                    },
                    None => return Err(CompilationError::new(format!("Unable to find variable {}", name), err_at))
                }
            },
            //return Err(CompilationError::new(format!("Unable to find variable {}", name), err_at)),
        }
    };
    let val = if compiler.do_var_as_ptr {
        var.clone()
    } else {
        if !var.get_basic_value().is_pointer_value() {
            panic!("this shouldnt happen");
        }
        println!("Loading var {} {:?}", name, var);
        Value::from(compiler.builder.build_load(var.get_basic_value().into_pointer_value(), format!("{}_variable_load", name).as_str()), match var.ty.ty.clone() {
            TypeEnum::PointerType(ptr) => *ptr,
            _ => panic!(),
        })
    };
    return Ok(val)
}
