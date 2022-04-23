use nom::{IResult, character::complete::multispace0, sequence::tuple, bytes::complete::tag, branch::alt};

use super::{expr::{Expr, L1Expr}, fndef::FnDef, vardef::VarDef, structdef::StructDef};

#[derive(PartialEq, Debug, Clone)]
pub enum TopLevelExpr<'a> {
    StructDef(StructDef<'a>),
    Assign(L1Expr<'a>, Expr<'a>),
    Expr(L1Expr<'a>),
}

fn parse_tl_l1<'a>(input: &'a str) -> IResult<&'a str, L1Expr> {
    alt((
        | input: &'a str | { let (remnant, fndef) = FnDef::parse(input)?; Ok((remnant, L1Expr::FnDef(fndef))) },
        | input: &'a str | { let (remnant, vardef) = VarDef::parse(input)?; Ok((remnant, L1Expr::VarDef(vardef))) }
    ))(input)
}

impl<'a> TopLevelExpr<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
                | input: &'a str | { let (remnant,(structdef, _, _)) = tuple((StructDef::parse, multispace0, tag(";")))(input)?; Ok((remnant, TopLevelExpr::StructDef(structdef))) },
                | input: &'a str | { let (remnant, (expr1, _, _, _, expr2, _, _)) = tuple((parse_tl_l1, multispace0, tag("="), multispace0, Expr::parse, multispace0, tag(";")))(input)?; Ok((remnant, TopLevelExpr::Assign(expr1, expr2))) },
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
