use inkwell::{types::{BasicTypeEnum, AnyTypeEnum, BasicType, AnyType}, AddressSpace};
use parser::syntax::ty::Ty;

use crate::value::{CompilerType, TypeEnum};

use super::{CompilerInstance, CompilationError, proto::compile_proto};

pub fn compile_basic_type<'a>(ty: Ty<'a>, compiler: CompilerInstance<'a>) -> Result<CompilerType<'a>, CompilationError<'a>> {
    match ty.val {
        parser::syntax::ty::TypeVariants::Plain(name) => { // TODO: should search local b4 global?
            match compiler.compiler.read().unwrap().global_types.get(&ty) {
                Some(s) => Ok(s.clone()),
                None => match compiler.local_types.get(&ty) {
                    Some(s) => Ok(s.clone()),
                    None => Err(CompilationError::new_anon(format!("Unable to find type {:?}", name))),
                }
            }
        },
        parser::syntax::ty::TypeVariants::PtrTo(target) => {let val = compile_basic_type(*target, compiler)?; Ok(CompilerType::new_ptr_to(val.clone(), get_ptr_type(val.underlying).as_any_type_enum()))},
        parser::syntax::ty::TypeVariants::Struct(_) => todo!(),
        parser::syntax::ty::TypeVariants::FnTy(fnproto) => {let (fnty, _, args_ty, ret_ty) = compile_proto(*fnproto, compiler)?; Ok(CompilerType::new(fnty.as_any_type_enum(), TypeEnum::FunctionType(args_ty, Box::new(ret_ty))))},
    }
    // match compiler.compiler.read().unwrap().global_types.get(ty.ty.render()) {
    //     Some(s) => Ok(s.clone()),
    //     None => match compiler.local_types.get(ty.ty.render()) {
    //         Some(s) => Ok(s.clone()),
    //         None => Err(CompilationError::new(format!("Unable to find type {}", ty.ty.render()), ty.ty)),
    //     }
    // }
}

fn get_ptr_type<'a>(ty: AnyTypeEnum<'a>) -> BasicTypeEnum<'a> {
    match ty {
        AnyTypeEnum::ArrayType(a) => a.ptr_type(AddressSpace::Generic).as_basic_type_enum(),
        AnyTypeEnum::FloatType(f) => f.ptr_type(AddressSpace::Generic).as_basic_type_enum(),
        AnyTypeEnum::FunctionType(f) => f.ptr_type(AddressSpace::Generic).as_basic_type_enum(),
        AnyTypeEnum::IntType(i) => i.ptr_type(AddressSpace::Generic).as_basic_type_enum(),
        AnyTypeEnum::PointerType(p) => p.ptr_type(AddressSpace::Generic).as_basic_type_enum(),
        AnyTypeEnum::StructType(s) => s.ptr_type(AddressSpace::Generic).as_basic_type_enum(),
        AnyTypeEnum::VectorType(v) => v.ptr_type(AddressSpace::Generic).as_basic_type_enum(),
        AnyTypeEnum::VoidType(_) => todo!(),
    }
}

//
// pub fn compile_any_type<'a>(ty: Ty<'a>, compiler: CompilerInstance<'a>) -> Result<AnyTypeEnum<'a>, CompilationError<'a>> {
//     match compile_basic_type(ty.clone(), compiler.clone()) {
//         Ok(s) => Ok(s.as_any_type_enum()),
//         Err(e) => match compiler.compiler.read().unwrap().global_any_types.get(ty.ty.render()) {
//             Some(s) => Ok(s.as_any_type_enum()),
//             None => return Err(CompilationError::new(format!("Unable to find type {}", ty.ty.render()), ty.ty))
//         }
//     }
// }
