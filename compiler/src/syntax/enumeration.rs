use inkwell::types::AnyType;
use parser::syntax::{enumeration::Enum, ty::TypeVariants};

use crate::value::{CompilerType, TypeEnum, Value};

use super::{CompilationError, CompilerInstance};

pub fn compile_enum<'a>(enumer: Enum<'a>, compiler: CompilerInstance<'a>) -> Result<(), CompilationError<'a>> {
    let ty = CompilerType::new(compiler.compiler.read().unwrap().context.i64_type().as_any_type_enum(), TypeEnum::IntType);
    compiler.compiler.write().unwrap().global_types.insert(enumer.name.clone(), ty);

    let name = if let TypeVariants::Plain(s) = enumer.name.val {
        s
    } else {
        return Err(CompilationError::new_anon("Expected plain name for enum".to_string()))
    };

    for (index, i) in enumer.variants.iter().enumerate() {
        let val = compiler.compiler.read().unwrap().context.i64_type().const_int((index + 1) as u64, false);   // const_int((index + 1) as u64, false);
        let val = Value::from_int_value(val);
        compiler.compiler.write().unwrap().global_consts.insert(format!("{}#{}", name, i.render()), val);
    }
    Ok(())
}
