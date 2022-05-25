use parser::{lexer::Lexer, syntax::{ParserState, parse_tl_expr}};

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args.len() != 2 {
        println!("bad args format");
        return;
    }
    let file = std::fs::read_to_string(args[1].clone()).unwrap();

    let lexer = Lexer::new(&file);
    let state = ParserState::new();
    lexer.eat_wsp();
    // println!("{} {}", file, lexer.is_eof());
    while !lexer.is_eof() {
        let res = parse_tl_expr(lexer.clone(), state.clone());
        println!("> {:#?}", res.unwrap());
        lexer.eat_wsp();
    }
}
