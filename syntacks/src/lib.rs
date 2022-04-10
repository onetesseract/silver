pub mod parser;
pub mod recipies;

#[cfg(test)]
mod tests {
    use crate::parser;

    #[test]
    fn it_works() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }
    #[test]
    fn aaa() {
        let s = r#""A" | "B": ee | "C""#;
        println!("{}", s);
        println!("{:?}", parser::Rule::parse(s));
    }
}
