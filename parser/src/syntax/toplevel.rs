use nom::{IResult, character::complete::multispace0, sequence::tuple, bytes::complete::tag, branch::alt};

use super::expr::Expr;

#[derive(PartialEq, Debug, Clone)]
pub enum TopLevelExpr<'a> {
    Assign(Expr<'a>, Expr<'a>),
    Expr(Expr<'a>),
}

impl<'a> TopLevelExpr<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
                | input: &'a str | { let (remnant, (expr1, _, _, _, expr2)) = tuple((Expr::parse, multispace0, tag("="), multispace0, Expr::parse))(input)?; Ok((remnant, TopLevelExpr::Assign(expr1, expr2))) },
                | input: &'a str | { let (remnant, expr) = Expr::parse(input)?; Ok((remnant, TopLevelExpr::Expr(expr))) }
        ))(input)
    }
}

mod tests {
    use crate::syntax::{toplevel::TopLevelExpr, expr::Expr};

    #[test]
    fn tl_parsing() {
        println!("big one {:#?}", TopLevelExpr::parse(r#"main (argc int, argv &&str)int = {puts()}"#))
    }
}
