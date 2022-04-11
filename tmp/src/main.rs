extern crate syntacks;
extern crate parser;
// use std::{fs, collections::HashMap};

// use syntacks::parser::{Rule, Statement};

fn main() {
    // let s = fs::read_to_string("grammar").unwrap();
    // let s = s.trim();
    //
    // let mut rules: HashMap<&str, (Rule, Option<String>)> = HashMap::new();
    //
    // let (mut remnant, mut stmt) = Statement::parse(&s).unwrap();
    // rules.insert(stmt.name, (stmt.rule.clone(), stmt.content.clone()));
    //
    // while remnant != "" {
    //     println!("p");
    //     let (remnant_, stmt_) = Statement::parse(remnant.trim_start()).unwrap();
    //     remnant = remnant_;
    //     stmt = stmt_;
    //     rules.insert(stmt.name, (stmt.rule.clone(), stmt.content.clone()));
    // }
    // println!("{:?}", rules);
    
    println!("{:?}", parser::syntax::expr::Expr::parse("a = (uu aa,) { ee(uu) }"));
}
