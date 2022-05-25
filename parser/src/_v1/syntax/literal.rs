use nom::{IResult, branch::alt, combinator::recognize, sequence::tuple, character::is_digit, bytes::complete::{take_while, tag, take_while1}};

use crate::parsestring::parse_string;

#[derive(PartialEq, Debug, Clone)]
pub enum Literal {
    Str(String),
    Int(isize),
    Float(f64),
}
impl<'a> Literal {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        Ok(
            alt((
                | input: &'a str | { let (remnant, s) = recognize(tuple((take_while1(| c: char | is_digit(c as u8)), tag("."), take_while1(| c: char | is_digit(c as u8)))))(input)?; Ok((remnant, Literal::Float(s.parse::<f64>().unwrap()))) },
                | input: &'a str | { let (remnant, s) = take_while1(| c: char | is_digit(c as u8))(input)?; Ok((remnant, Literal::Int(s.parse().unwrap()))) },
                | input: &'a str | { let (remnant, s) = parse_string(input)?; Ok((remnant, Literal::Str(s))) }
    ))(input)?
        )
    }
}

// mod tests {
//     use crate::syntax::literal::Literal;
//
//     // #[test]
//     // fn literal_parsing() {
//     //     assert_eq!(Literal::parse("\"sksk\n\\\"baaa\"").unwrap(), ("", Literal::Str("sksk\n\"baaa".to_string())))
//     // }
// }
