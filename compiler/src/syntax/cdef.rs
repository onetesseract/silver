use parser::syntax::{cdef::CDef, ExprVal};

use crate::asm::compile_asm;

use super::{CompilerInstance, CompilationError, CompilationResult};

pub fn compile_cdef<'a>(cdef: CDef<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    match cdef.name.render() {
        "AS" => {
            match &*cdef.inputs[0].val {
                ExprVal::String(s) => compile_asm(compiler, s.rendered.clone(), s.begin.clone()),
                _ => return Err(CompilationError::new("Expected str for assembly".to_string(), cdef.name))
            }
        }
        unknown => return Err(CompilationError::new(format!("Unknown cdef {}", unknown), cdef.name))
    }
}

