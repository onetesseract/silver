pub mod parser;
pub(crate) mod parsestring;
pub mod syntax;

#[cfg(test)]
mod tests {
    use crate::syntax::toplevel::TopLevelExpr;

    // #[test]
    // fn it_works() {
    //     let result = 2 + 2;
    //     assert_eq!(result, 4);
    // }

    #[test]
    fn other_one() {
        let input = std::fs::read_to_string("./test.silver").unwrap();
        let (remnant, result) = TopLevelExpr::parse(input.as_str()).unwrap();
        println!("Remnant: {}", remnant);
        println!("Expr: {:#?}", result);
    }
}
