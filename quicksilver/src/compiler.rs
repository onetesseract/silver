use std::collections::HashMap;

use inkwell::{context::Context, builder::Builder, passes::PassManager, values::{FunctionValue, PointerValue, BasicMetadataValueEnum, CallableValue, BasicValueEnum}, module::Module, types::{BasicTypeEnum, AnyTypeEnum}};
use parser::syntax::{expr::Expr, fndef::FnDef};

pub struct Compiler<'a, 'ctx> {
    pub context: &'ctx Context,
    pub builder: &'a Builder<'ctx>,
    pub fpm: &'a PassManager<FunctionValue<'ctx>>,
    pub module: &'a Module<'ctx>,
    pub function: &'a (FnDef<'ctx>, Expr<'ctx>),

    variables: HashMap<String, PointerValue<'ctx>>,
    fn_val_opt: Option<FunctionValue<'ctx>>,
}

impl<'a, 'ctx> Compiler<'a, 'ctx> {
    /// Gets a defined function given a name
    fn get_function(&self, name: &str) -> Option<FunctionValue<'ctx>> {
        self.module.get_function(name)
    }

    /// Gets the function being compiled
    fn fn_value(&self) -> FunctionValue<'ctx> {
        self.fn_val_opt.unwrap()
    }

    /// Creates a stack allocation instruction in the entry block of a function (reserves space for
    /// a variable)
    fn create_entry_block_alloca(&self, name: &str, ty: BasicTypeEnum<'ctx>) -> PointerValue<'ctx> {
        let builder = self.context.create_builder();

        let entry = self.fn_value().get_first_basic_block().unwrap();

        match entry.get_first_instruction() {
            Some(first) => builder.position_before(&first),
            None => builder.position_at_end(entry),
        }
        builder.build_alloca(ty, name)
    }

    fn build_call(&self, target: PointerValue<'ctx>, args: Vec<BasicValueEnum<'ctx>>) -> Result<Option<BasicValueEnum<'ctx>>, String> {
        let argsv: Vec<BasicMetadataValueEnum> = args.iter().by_ref().map(|&val| val.into()).collect();
        let call = self.builder.build_call(CallableValue::try_from(target).unwrap(), argsv.as_slice(), "tmpcall")
            .try_as_basic_value();
        if call.is_left() {
            Ok(Some(call.left().unwrap()))
        } else {
            Ok(None)
        }
    }

    /// Compiles the given Expr into a BasicTypeEnum
    fn compile_expr(&mut self, expr: &Expr) -> Result<Option<BasicValueEnum<'ctx>>, String> {
        match expr {
            Expr::Call(call) => {
                match call.is_infix {
                    true => todo!(),
                    false => {
                        let mut args = vec![];
                        for i in &call.args {
                            args.push(self.compile_expr(i)?.expect("y u passing a void value as an arg"))
                        }
                        let target = match self.compile_expr(&call.function)    ? {
                            Some(value) => match value {
                                BasicValueEnum::PointerValue(p) => p,
                                _ => return Err(format!("{:?} is not a pointer value yet you want to call it. curious.", value))
                            },
                            None => return Err("You can't call a null value".to_string()),
                        };
                        self.build_call(target, args)
                    },
                }
            },
            Expr::Atom(_) => todo!(),
            Expr::VarDef(_) => todo!(),
            Expr::FnDef(_) => todo!(),
        }
    }
}

