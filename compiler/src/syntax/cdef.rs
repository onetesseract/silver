use parser::{syntax::{cdef::CDef, ExprVal, ParserState, parse_tl_expr, ty::{Ty, TypeVariants}}, lexer::Lexer};

use crate::{asm::compile_asm, value::Value};

use super::{CompilerInstance, CompilationError, CompilationResult, compile_tl_expr, ty::compile_basic_type};

pub fn compile_other_file<'a>(source_name: String, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    let lexer = Lexer::new(compiler.compiler.read().unwrap().sources.get(&source_name).unwrap().to_string());
    let state = ParserState::new();
    lexer.eat_wsp();

    while !lexer.is_eof() {
        let res = parse_tl_expr(lexer.clone(), state.clone());
        compile_tl_expr(res.unwrap(), compiler.clone()).unwrap();
        lexer.eat_wsp();
    }

    Ok(Value::void_value(compiler.compiler.read().unwrap().context) )
}

pub fn compile_cdef<'a>(cdef: CDef<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    match cdef.name.render().as_str() {
        "AS" => {
            match &*cdef.inputs[0].val {
                ExprVal::String(s) => compile_asm(compiler, s.rendered.clone(), s.begin.clone()),
                _ => return Err(CompilationError::new("Expected str for assembly".to_string(), cdef.name))
            }
        }
        "include" => {
            match &*cdef.inputs[0].val {
                ExprVal::String(s) => {
                    // TODO: don't unwrap
                    let file = std::fs::read_to_string(s.rendered.clone()).unwrap();
                    compiler.compiler.write().unwrap().sources.insert(s.rendered.clone(), file);
                    compile_other_file(s.rendered.clone(), compiler)
                },
                _ => return Err(CompilationError::new("Expected str for include".to_string(), cdef.name))
            }

        },
        "sizeof" => {
            match &*cdef.inputs[0].val {
                ExprVal::Variable(varname) => {
                    let ty = compile_basic_type(Ty {template: None, val: TypeVariants::Plain(varname.name.render())}, compiler)?;
                    Ok(Value::from_int_value(ty.underlying.size_of().unwrap()))
                }
                _ => return Err(CompilationError::new("Expected type for include".to_string(), cdef.name))
            }
        },
        unknown => return Err(CompilationError::new(format!("Unknown cdef {}", unknown), cdef.name))
    }
}

