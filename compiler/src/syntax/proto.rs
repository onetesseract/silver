use inkwell::{types::FunctionType, types::{BasicMetadataTypeEnum, BasicType}};
use parser::syntax::proto::FnProto;

use super::{CompilerInstance, CompilationError, ty::compile_basic_type};

pub fn compile_proto<'a>(proto: FnProto<'a>, compiler: CompilerInstance<'a>) -> Result<FunctionType<'a>, CompilationError<'a>> {
    let mut inputs: Vec<BasicMetadataTypeEnum> = vec![];
    
    for i in proto.args {
         inputs.push(compile_basic_type(i.ty, compiler.clone())?.into())
    }

    Ok(match proto.return_ty {
        Some(s) => compile_basic_type(s, compiler.clone())?.fn_type(inputs.as_slice(), false),
        None => compiler.compiler.read().unwrap().context.void_type().fn_type(inputs.as_slice(), false),
    })
}

