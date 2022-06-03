use inkwell::values::{BasicValueEnum, BasicMetadataValueEnum, CallableValue};
use parser::syntax::call::CallExpr;

use super::{CompilerInstance, CompilationError, variable::compile_variable, expr_codegen};

pub fn compile_call<'a>(expr: CallExpr<'a>, compiler: CompilerInstance<'a>) -> Result<Option<BasicValueEnum<'a>>, CompilationError<'a>> {
    let mut compiler = compiler;
    compiler.do_var_as_ptr = true;
    let target = compile_variable(expr.target.clone(), compiler.clone())?.into_pointer_value();

    compiler.do_var_as_ptr = false;
    
    let mut inputs = vec![];
    for i in expr.inputs {
        inputs.push(match expr_codegen(i, compiler.clone())? {
            Some(s) => s,
            None => return Err(CompilationError::new(format!("Cannot use a nil value as a call arg"), expr.target.name)),
        })
    }

    let argsv: Vec<BasicMetadataValueEnum> = inputs.iter().by_ref().map(|&val| val.into()).collect();

    let target = match CallableValue::try_from(target) {
        Ok(s) => s,
        Err(e) => return Err(CompilationError::new(format!("Cannot call {}, is it a function? (error {:?})", expr.target.name.render(), e), expr.target.name)),
    };

    let call = compiler.builder.build_call(target, argsv.as_slice(), format!("{}_call", expr.target.name.render()).as_str()).try_as_basic_value();
    if call.is_left() {
        Ok(Some(call.left().unwrap()))
    } else {
        Ok(None)
    }
}
