use inkwell::types::{BasicTypeEnum, AnyTypeEnum, AnyType};
use parser::syntax::ty::Ty;

use super::{CompilerInstance, CompilationError};

pub fn compile_basic_type<'a>(ty: Ty<'a>, compiler: CompilerInstance<'a>) -> Result<BasicTypeEnum<'a>, CompilationError<'a>> {
    match compiler.compiler.read().unwrap().global_basic_types.get(ty.ty.render()) {
        Some(s) => Ok(*s),
        None => Err(CompilationError::new(format!("Unable to find type {}", ty.ty.render()), ty.ty))
    }
}

pub fn compile_any_type<'a>(ty: Ty<'a>, compiler: CompilerInstance<'a>) -> Result<AnyTypeEnum<'a>, CompilationError<'a>> {
    match compile_basic_type(ty.clone(), compiler.clone()) {
        Ok(s) => Ok(s.as_any_type_enum()),
        Err(e) => match compiler.compiler.read().unwrap().global_any_types.get(ty.ty.render()) {
            Some(s) => Ok(s.as_any_type_enum()),
            None => return Err(CompilationError::new(format!("Unable to find type {}", ty.ty.render()), ty.ty))
        }
    }
}
