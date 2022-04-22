use nom::{IResult, character::complete::multispace0, sequence::tuple, bytes::complete::tag, branch::alt, combinator::fail};

use super::expr::{Expr, L1Expr};

#[derive(PartialEq, Debug, Clone)]
pub enum TopLevelExpr<'a> {
    Assign(L1Expr<'a>, L1Expr<'a>),
    Expr(L1Expr<'a>),
}

impl<'a> TopLevelExpr<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
                | input: &'a str | { let (remnant, (expr1, _, _, _, expr2, _, _)) = tuple((L1Expr::parse, multispace0, tag("="), multispace0, L1Expr::parse, multispace0, tag(";")))(input)?; Ok((remnant, TopLevelExpr::Assign(expr1, expr2))) },
                // | _input:&'a str | { fail(input) },
                | input: &'a str | { let (remnant,(expr, _, _)) = tuple((L1Expr::parse, multispace0, tag(";")))(input)?; Ok((remnant, TopLevelExpr::Expr(expr))) }
        ))(input)
    }
}

mod tests {
    use crate::syntax::{toplevel::TopLevelExpr, expr::Expr};

    #[test]
    fn tl_parsing() {
        println!("big one {:#?}", Expr::parse(r#"*one"#))
    }
}
