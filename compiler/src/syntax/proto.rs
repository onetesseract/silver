use inkwell::{types::FunctionType, types::{BasicMetadataTypeEnum, BasicType}};
use parser::syntax::proto::FnProto;

use super::{CompilerInstance, CompilationError, ty::compile_basic_type};

pub fn compile_proto<'a>(proto: FnProto<'a>, compiler: CompilerInstance<'a>) -> Result<(FunctionType<'a>, Vec<BasicMetadataTypeEnum<'a>>), CompilationError<'a>> {
    let mut inputs: Vec<BasicMetadataTypeEnum> = vec![];
    
    for i in proto.args {
         inputs.push(compile_basic_type(i.ty, compiler.clone())?.try_basic_type().unwrap().into())
    }

    Ok((match proto.return_ty {
        Some(s) => compile_basic_type(s, compiler.clone())?.try_basic_type().unwrap().fn_type(inputs.as_slice(), false),
        None => compiler.compiler.read().unwrap().context.void_type().fn_type(inputs.as_slice(), false),
    }, inputs))
}

