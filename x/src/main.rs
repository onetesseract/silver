use std::sync::{Arc, RwLock};

use compiler::syntax::{
    compile_tl_expr, CompilerInstance, CompilerInternal, CompilerInternalConfig,
};
use parser::{
    lexer::Lexer,
    syntax::{parse_tl_expr, ParserState},
};

use inkwell::context::Context;

fn main() {
    let int_width = std::env::var("INT_WIDTH")
        .map(|x| x.parse::<u64>().unwrap())
        .unwrap_or(64);
    let config = CompilerInternalConfig { int_width };

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
        let compiler = CompilerInternal::new(&context, Arc::new(module), config);
        let compiler = Arc::new(RwLock::new(compiler));
        // println!("{} {}", file, lexer.is_eof());
        while !lexer.is_eof() {
            let res = parse_tl_expr(lexer.clone(), state.clone());
            if let Err(ref p) = res {
                println!("ERROR:\n{}", p.message);
                panic!()
            }
            println!("> {:#?}", res.clone().unwrap());
            let instance = CompilerInstance::new(compiler.clone());
            let res = compile_tl_expr(res.unwrap(), instance);
            println!("hereee");

            if let Err(e) = res {
                print!("Error: {}", e.message);
                panic!("Error: {}", e.message);
            }
            lexer.eat_wsp();
        }
        let filename = if args[1].ends_with(".silver") {
            args[1][..(args[1].len() - 7)].to_string() + ".ll"
        } else {
            args[1].to_string() + ".ll"
        };
        compiler
            .read()
            .unwrap()
            .module
            .print_to_file(filename)
            .unwrap();
        compiler.read().unwrap().module.print_to_stderr();
    }
}
