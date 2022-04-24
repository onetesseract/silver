use nom::{IResult, combinator::{map_res, recognize}, multi::many1, character::complete::one_of};

pub mod parser;
pub(crate) mod parsestring;
pub mod syntax;

const RESERVED: [&str; 4] = ["if", "else", "enum", "as"];

pub(crate) fn take_number(input: &str) -> IResult<&str, usize> {
    map_res(
        recognize(
            many1(
                one_of("0123456789")
            )
        ),
        |out: &str| usize::from_str_radix(out, 10)
    )(input)
}

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
