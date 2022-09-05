use inkwell::{values::{BasicValueEnum, IntValue, BasicValue, FloatValue, PointerValue}, types::{AnyTypeEnum, AnyType, BasicTypeEnum}, context::Context};
use parser::lexer::LexString;

#[derive(Debug, Clone)]
pub struct Value<'a> {
    pub ty: CompilerType<'a>,
    // TODO: source code positions
    pub value: Option<NonVoidValue<'a>>,
}
impl<'a> Value<'a> {
    pub fn from_int_value(value: IntValue<'a>) -> Self {
        Value { ty: CompilerType::new(value.get_type().as_any_type_enum(), TypeEnum::IntType), value: Some(NonVoidValue::new(value.as_basic_value_enum())) }
    }
    pub fn from_float_value(value: FloatValue<'a>) -> Self {
        Value { ty: CompilerType::new(value.get_type().as_any_type_enum(), TypeEnum::FloatType), value: Some(NonVoidValue::new(value.as_basic_value_enum())) }
    }
    // pub fn from_ptr_value(value: PointerValue<'a>) -> Self {
    //     Value { ty: CompilerType::new(value.get_type().as_any_type_enum()), value: Some(NonVoidValue::new(value.as_basic_value_enum())) }
    // }
    pub fn from_bool_value(value: IntValue<'a>) -> Self {
        Value { ty: CompilerType::new(value.get_type().as_any_type_enum(), TypeEnum::BoolType), value: Some(NonVoidValue::new(value.as_basic_value_enum())) }
    }
    pub fn void_value(context: &'a Context) -> Self {
        Value { ty: CompilerType::new(context.void_type().as_any_type_enum(), TypeEnum::VoidType), value: None }
    }
    pub fn from(value: BasicValueEnum<'a>, ty: CompilerType<'a>) -> Self {
        Value { ty, value: Some(NonVoidValue::new(value)) }
    }

    pub fn is_void(&self) -> bool {
        self.value.is_none()
    }
    pub fn get_value(&self) -> NonVoidValue<'a> {
        self.value.clone().unwrap()
    }
    pub fn get_basic_type(&self) -> Option<BasicTypeEnum<'a>> {
        self.ty.try_basic_type()
    }
    pub fn get_basic_value(&self) -> BasicValueEnum<'a> {
        self.value.clone().unwrap().value
    }
    pub fn into_ptr_value(&self) -> PointerValue<'a> {
        self.get_basic_value().into_pointer_value()
    }
    pub fn into_int_value(&self) -> IntValue<'a> {
        self.get_basic_value().into_int_value()
    }
    pub fn into_float_value(&self) -> FloatValue<'a> {
        self.get_basic_value().into_float_value()
    }
}

#[derive(Debug, Clone, PartialEq)]
pub struct CompilerType<'a> {
    pub underlying: AnyTypeEnum<'a>,
    pub ty: TypeEnum<'a>,
}

#[derive(Debug, Clone, PartialEq)]
pub enum TypeEnum<'a> {
    VoidType,
    IntType,
    FloatType,
    BoolType,
    StructType(StructType<'a>),
    PointerType(Box<CompilerType<'a>>),
    FunctionType(Vec<CompilerType<'a>>, Box<CompilerType<'a>>)
}

impl<'a> CompilerType<'a> {
    // pub fn from(ty: AnyTypeEnum<'a>) -> Self {
    //     let ty_enum = match ty {
    //         AnyTypeEnum::ArrayType(_) => todo!(),
    //         AnyTypeEnum::FloatType(_) => TypeEnum::FloatType,
    //         AnyTypeEnum::FunctionType(_) => todo!(),
    //         AnyTypeEnum::IntType(_) => TypeEnum::IntType,
    //         AnyTypeEnum::PointerType(p) => TypeEnum::PointerType(Box::new(CompilerType::new(p.get_element_type()))),
    //         AnyTypeEnum::StructType(_) => todo!(),
    //         AnyTypeEnum::VectorType(_) => todo!(),
    //         AnyTypeEnum::VoidType(_) => todo!(),
    //         // BasicTypeEnum::ArrayType(_) => todo!(),
    //         // BasicTypeEnum::FloatType(_) => TypeEnum::FloatType,
    //         // BasicTypeEnum::IntType(_) => TypeEnum::IntType,
    //         // BasicTypeEnum::PointerType(p) => TypeEnum::PointerType(Box::new(TypeEnum::from(p.get_element_type()))),
    //         // BasicTypeEnum::StructType(_) => todo!(),
    //         // BasicTypeEnum::VectorType(_) => todo!(),
    //     };
    //     CompilerType { underlying: ty, ty: ty_enum }
    // }
    pub fn new(underlying: AnyTypeEnum<'a>, ty: TypeEnum<'a>) -> Self {
        CompilerType { underlying, ty }
    }

    pub fn try_basic_type(&self) -> Option<BasicTypeEnum<'a>> {
        match self.underlying {
            AnyTypeEnum::ArrayType(a) => Some(BasicTypeEnum::ArrayType(a)),
            AnyTypeEnum::FloatType(f) => Some(BasicTypeEnum::FloatType(f)),
            AnyTypeEnum::FunctionType(_) => None,
            AnyTypeEnum::IntType(i) => Some(BasicTypeEnum::IntType(i)),
            AnyTypeEnum::PointerType(p) => Some(BasicTypeEnum::PointerType(p)),
            AnyTypeEnum::StructType(s) => Some(BasicTypeEnum::StructType(s)),
            AnyTypeEnum::VectorType(v) => Some(BasicTypeEnum::VectorType(v)),
            AnyTypeEnum::VoidType(_) => None,
        }
    }

    pub fn new_ptr_to(to: CompilerType<'a>, underlying: AnyTypeEnum<'a>) -> Self {
        CompilerType { underlying, ty: TypeEnum::PointerType(Box::new(to)) }
    }
}

#[derive(Debug, Clone, PartialEq)]
pub struct StructType<'a> {
    pub values: Vec<(LexString<'a>, TypeEnum<'a>)>,
}

#[derive(Debug, Clone)]
pub struct NonVoidValue<'a> {
    pub value: BasicValueEnum<'a>,
}
impl<'a> NonVoidValue<'a> {
    pub fn new(value: BasicValueEnum<'a>) -> Self {
        NonVoidValue { value }
    }
}
