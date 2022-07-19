use inkwell::{types::{BasicTypeEnum, AnyTypeEnum, BasicType, AnyType}, AddressSpace};
use parser::syntax::{ty::Ty, Tl};

use crate::value::{CompilerType, TypeEnum, StructType};

use super::{CompilerInstance, CompilationError, proto::compile_proto};

pub fn compile_basic_type<'a>(ty: Ty<'a>, compiler: CompilerInstance<'a>) -> Result<CompilerType<'a>, CompilationError<'a>> {
    match ty.val {
        parser::syntax::ty::TypeVariants::Plain(ref name) => {
            match compiler.local_types.get(&ty) {
                Some(s) => Ok(s.clone()),
                None => match compiler.compiler.read().unwrap().global_types.get(&ty) {
                    Some(s) => Ok(s.clone()),
                    None => if let Some(s) = ty.template {
                        let mut comp_tys = vec![];
                        for i in s.params {
                            comp_tys.push(compile_basic_type(i.name, compiler.clone())?);
                        }
                        compile_ty_template(name.to_string(), comp_tys, compiler.clone())
                    } else {
                        Err(CompilationError::new_anon(format!("Unable to find type {:?}", name)))
                    },
                }
            }
        },
        parser::syntax::ty::TypeVariants::PtrTo(target) => {let val = compile_basic_type(*target, compiler)?; Ok(CompilerType::new_ptr_to(val.clone(), get_ptr_type(val.underlying).as_any_type_enum()))},
        parser::syntax::ty::TypeVariants::Struct(s_ty) => {
            let mut types = vec![];
            let mut struct_name_pairs = vec![];
            for i in s_ty {
                let t = compile_basic_type(i.ty, compiler.clone())?;
                types.push(t.clone());

                struct_name_pairs.push((i.varname, t.ty));
            }

            let basic_types: Vec<BasicTypeEnum> = types.iter().map(|t| t.try_basic_type().unwrap()).collect();

            let struct_type = compiler.compiler.read().unwrap().context.struct_type(&basic_types, false); // TODO: packing
            

            
            let comp_ty = CompilerType::new(struct_type.as_any_type_enum(), TypeEnum::StructType(StructType {values: struct_name_pairs}));

            Ok(comp_ty)
        },
        parser::syntax::ty::TypeVariants::FnTy(fnproto) => {let (fnty, _, args_ty, ret_ty) = compile_proto(*fnproto, compiler)?; Ok(CompilerType::new(fnty.as_any_type_enum(), TypeEnum::FunctionType(args_ty, Box::new(ret_ty))))},
    }
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

pub fn compile_ty_template<'a>(name: String, types: Vec<CompilerType<'a>>, compiler: CompilerInstance<'a>) -> Result<CompilerType<'a>, CompilationError<'a>> {
    let read = compiler.compiler.read().unwrap();
    let ty = if let Some(s) = read.global_ty_templates.get(&name) {
        s
    } else {
        return Err(CompilationError::new_anon(format!("Unable to find template type {}", name)));
    };

    if types.len() != ty.template.clone().unwrap().params.len() {
        return Err(CompilationError::new_anon(format!("Expected {} type params but got {} for {}", ty.template.as_ref().unwrap().params.len(), types.len(), name)));
    }

    let mut compiler = compiler.clone();

    let mut pairs = vec![];

    for (index, i) in types.iter().enumerate() {
        pairs.push((ty.template.as_ref().unwrap().params[index].clone(), i));
        compiler.local_types.insert(ty.template.as_ref().unwrap().params[index].name.clone(), i.clone());
    }

    let typedef_ty = if let Tl::Typedef(_name, ty) = &ty.tl {
        ty.clone()
    } else {
        panic!()
    };

    let t = compile_basic_type(typedef_ty, compiler);

    return t;
}

