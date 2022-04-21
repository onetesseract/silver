use nom::{IResult, branch::alt, character::complete::multispace0, bytes::complete::tag, sequence::tuple};

use super::{atom::Atom, call::Call, vardef::VarDef, fndef::FnDef};

#[derive(PartialEq, Debug, Clone)]
pub enum Expr<'a> {
    Call(Call<'a>),
    Atom(Atom<'a>),
    VarDef(VarDef<'a>),
    FnDef(FnDef<'a>),
    Bracketed(Box<Expr<'a>>),
    Reference(Box<Expr<'a>>),
    Dereference(Box<Expr<'a>>),
}

impl<'a> Expr<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            | input: &'a str | { let (remnant, (_, _, expr, _, _)) = tuple((tag("("), multispace0, Expr::parse, multispace0, tag(")")))(input)?;
                Ok((remnant, Expr::Bracketed(Box::new(expr)))) },
            | input: &'a str | { let (remnant, fndef) = FnDef::parse(input)?; Ok((remnant, Expr::FnDef(fndef))) },
            | input: &'a str | { let (remnant, call) = Call::parse(input)?; Ok((remnant, Expr::Call(call))) },
            | input: &'a str | { let (remnant, vardef) = VarDef::parse(input)?; Ok((remnant, Expr::VarDef(vardef))) },
            | input: &'a str | { let (remnant, (_, _, expr)) = tuple((tag("&"), multispace0, Expr::parse))(input)?; Ok((remnant, Expr::Reference(Box::new(expr)))) },
            | input: &'a str | { let (remnant, (_, _, expr)) = tuple((tag("*"), multispace0, Expr::parse))(input)?; Ok((remnant, Expr::Dereference(Box::new(expr)))) },
            | input: &'a str | { let (remnant, atom) = Atom::parse(input)?; Ok((remnant, Expr::Atom(atom))) },
        ))(input)
    }
}

mod tests {
    use crate::syntax::expr::Expr;

    #[test]
    fn expr_parsing() {
        println!("aaa {:?}", Expr::parse("&\"uu\""))
    }
}
