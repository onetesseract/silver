use inkwell::{types::FunctionType, types::{BasicMetadataTypeEnum, BasicType, AnyType}};
use parser::syntax::proto::FnProto;

use crate::value::{CompilerType, TypeEnum};

use super::{CompilerInstance, CompilationError, ty::compile_basic_type};

pub fn compile_proto<'a>(proto: FnProto<'a>, compiler: CompilerInstance<'a>) -> Result<(FunctionType<'a>, Vec<BasicMetadataTypeEnum<'a>>, Vec<CompilerType<'a>>, CompilerType<'a>), CompilationError<'a>> {
    let mut inputs: Vec<BasicMetadataTypeEnum> = vec![];
    let mut inputs_cty = vec![];
    
    for i in proto.args {
        let ty = compile_basic_type(i.ty, compiler.clone())?;
        inputs_cty.push(ty.clone());
        inputs.push(ty.try_basic_type().unwrap().into())
    }

    let (ret_ty, fn_ty) = match proto.return_ty {
        Some(s) => {let ty = compile_basic_type(s, compiler.clone())?; (ty.clone(), ty.try_basic_type().unwrap().fn_type(inputs.as_slice(), false))},
        None => {let void = compiler.compiler.read().unwrap().context.void_type(); (CompilerType::new(void.as_any_type_enum(), TypeEnum::VoidType), void.fn_type(inputs.as_slice(), false))},
    };

    Ok((fn_ty, inputs, inputs_cty, ret_ty))
}

