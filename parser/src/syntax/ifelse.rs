use nom::{IResult, bytes::complete::tag, sequence::tuple, character::complete::multispace0, combinator::opt};

use super::expr::Expr;

#[derive(PartialEq, Debug, Clone)]
pub struct IfElse<'a> {
    pub condition: Box<Expr<'a>>,
    pub then: Box<Expr<'a>>,
    pub els: Option<Box<Expr<'a>>>,
}

impl<'a> IfElse<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, IfElse> {
        let (remnant, (_, _, condition, _, then, els)) = tuple((tag("if"), multispace0, Expr::parse, multispace0, Expr::parse, opt(tuple((multispace0, tag("else"), multispace0, Expr::parse)))))(input)?;
        let els = match els {
            Some((_, _, _, ex)) => Some(Box::new(ex)),
            None => None,
        };
        Ok((remnant, IfElse {condition: Box::new(condition), then: Box::new(then), els}))
    }
}

mod tests {
    use crate::syntax::ifelse::IfElse;

    #[test]
    fn ifelse_parsing() {
        println!("ifelse {:#?}", IfElse::parse("if (inp == 7) {p = 8} else {9}"));
    }
}
