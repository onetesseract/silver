use std::sync::{Arc, RwLock};

use compiler::syntax::{CompilerInternal, CompilerInstance, compile_tl_expr};
use parser::{lexer::Lexer, syntax::{ParserState, parse_tl_expr}};

use inkwell::context::Context;

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args.len() != 2 {
        println!("bad args format");
        return;
    }
    let file = std::fs::read_to_string(args[1].clone()).unwrap();

    let lexer = Lexer::new(file);
    let state = ParserState::new();
    lexer.eat_wsp();

    let context = Context::create();

    let module = context.create_module(args[1].as_str());
    {

    let compiler = CompilerInternal::new(&context, Arc::new(module));
    let compiler = Arc::new(RwLock::new(compiler));
    println!("aaaaaaaa");
    // println!("{} {}", file, lexer.is_eof());
    while !lexer.is_eof() {
        println!("o");
        let res = parse_tl_expr(lexer.clone(), state.clone());
        println!("> {:#?}", res.clone().unwrap());
        let instance = CompilerInstance::new(compiler.clone());
        println!("1");
        compile_tl_expr(res.unwrap(), instance).unwrap();
        println!("2");
        lexer.eat_wsp();
    }

    compiler.read().unwrap().module.print_to_file(args[1].clone() + ".out.ll").unwrap();
    compiler.read().unwrap().module.print_to_stderr();
    }

}
