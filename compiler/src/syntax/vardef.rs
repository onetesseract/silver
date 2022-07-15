use inkwell::{values::{PointerValue, BasicValue}, types::{BasicTypeEnum, AnyType}};
use parser::syntax::vardef::VarDef;

use crate::value::{Value, CompilerType};

use super::{CompilerInstance, ty::compile_basic_type, CompilationResult};

pub fn compile_vardef<'a>(expr: VarDef<'a>, compiler: CompilerInstance<'a>) -> CompilationResult<'a> {
    let ty = compile_basic_type(expr.ty, compiler.clone())?;
    
    let ptr = entry_block_alloca(ty.try_basic_type().unwrap(), compiler.clone(), expr.varname.render());
    
    compiler.local_variables.write().unwrap().insert(expr.varname.render(), Value::from(ptr.as_basic_value_enum(), CompilerType::new_ptr_to(ty.clone(), ptr.get_type().as_any_type_enum())));

    return Ok(Value::from(ptr.as_basic_value_enum(), CompilerType::new_ptr_to(ty, ptr.get_type().as_any_type_enum())));
}

pub fn entry_block_alloca<'a>(ty: BasicTypeEnum<'a>, compiler: CompilerInstance<'a>, name: String) -> PointerValue<'a> {
    let entry_builder = compiler.compiler.read().unwrap().context.create_builder();
    match compiler.function.unwrap().get_first_basic_block().unwrap().get_first_instruction() {
        Some(s) => entry_builder.position_before(&s),
        None => entry_builder.position_at_end(compiler.function.unwrap().get_first_basic_block().unwrap()),
    }

    let ptr = entry_builder.build_alloca(ty, &name);
    return ptr;
}
