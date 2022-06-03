use inkwell::{values::PointerValue, types::BasicTypeEnum};
use parser::syntax::vardef::VarDef;

use super::{CompilerInstance, CompilationError, ty::compile_basic_type};

pub fn compile_vardef<'a>(expr: VarDef<'a>, compiler: CompilerInstance<'a>) -> Result<PointerValue<'a>, CompilationError<'a>> {
    let ty = compile_basic_type(expr.ty, compiler.clone())?;
    
    let ptr = entry_block_alloca(ty, compiler.clone(), expr.varname.render());
    
    compiler.local_variables.write().unwrap().insert(expr.varname.render(), ptr);

    return Ok(ptr);
}

pub fn entry_block_alloca<'a>(ty: BasicTypeEnum<'a>, compiler: CompilerInstance<'a>, name: &'a str) -> PointerValue<'a> {
    let entry_builder = compiler.compiler.read().unwrap().context.create_builder();
    match compiler.function.unwrap().get_first_basic_block().unwrap().get_first_instruction() {
        Some(s) => entry_builder.position_before(&s),
        None => entry_builder.position_at_end(compiler.function.unwrap().get_first_basic_block().unwrap()),
    }

    let ptr = entry_builder.build_alloca(ty, name);
    return ptr;
}
