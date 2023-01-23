use std::sync::{Arc, RwLock};

use inkwell::context::Context;
use parser::{
    lexer::Lexer,
    syntax::{parse_tl_expr, ParseError, ParserState, Tl},
};
use syntax::{
    cdef::compile_cdef, CompilationError, CompilerInstance, CompilerInternal, TargetType,
};

pub mod asm;
pub mod syntax;
pub mod value;

impl<'a> From<ParseError<'a>> for CompilationError<'a> {
    fn from(p: ParseError<'a>) -> Self {
        CompilationError {
            message: p.message.clone(),
            location: None,
            parse_err: Some(p),
        }
    }
    // add code here
}
/*
pub fn compile(input: String, file_name: Option<String>, root: CompilerInstance, add_references: bool) -> Result<(), CompilationError> {
    let lexer = Lexer::new(input);
    let state = ParserState::new();

    let context = root.compiler.read().unwrap().context;
    let module = context.create_module(file_name.unwrap_or("anon".to_string()).as_str());

    let compiler_internal = CompilerInternal::new(&context, Arc::new(module));
    let compiler = Arc::new(RwLock::new(compiler_internal));

    lexer.eat_wsp();
    while !lexer.is_eof() {
        let compiler = CompilerInstance::new(compiler.clone());
        let expr = parse_tl_expr(lexer.clone(), state.clone()).unwrap();
        if let Tl::CDef(c) = expr.tl {
            compile_cdef(c, compiler.clone()).unwrap();
            continue;
        }

        if let Some(ref _t) = expr.template {
            match expr.tl {
                Tl::Function(ref proto, _) => {
                    compiler.compiler.write().unwrap().global_fn_templates.insert(TargetType::from(proto.name.clone()), expr.clone());
                    if add_references {
                        root.compiler.write().unwrap().global_fn_templates.insert(TargetType::from(proto.name.clone()), expr);
                    }
                },
                Tl::Typedef(ref typedef, _) => {
                    compiler.compiler.write().unwrap().global_ty_templates.insert(typedef.render(), expr.clone());
                    if add_references {
                        root.compiler.write().unwrap().global_ty_templates.insert(typedef.render(), expr);
                    }
                },
                Tl::CDef(_) => todo!(),
                Tl::Enum(_) => todo!(),
                Tl::Macro(_, _) => todo!(),
            };
        }
    }

    todo!()
}
*/
#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }
}
