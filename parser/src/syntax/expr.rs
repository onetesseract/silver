use nom::{IResult, branch::alt, character::complete::multispace0, bytes::complete::tag, sequence::tuple};

use crate::take_number;

use super::{atom::Atom, call::Call, vardef::VarDef, fndef::FnDef, ifelse::IfElse};

#[derive(PartialEq, Debug, Clone)]
pub enum Expr<'a> {
    Call(Call<'a>),
    Atom(Atom<'a>),
    Bracketed(Box<Expr<'a>>),
    Reference(Box<Expr<'a>>),
    Dereference(Box<Expr<'a>>),
    IfElse(IfElse<'a>),
    ArrayAccess(Atom<'a>, Box<Expr<'a>>),
}

#[derive(PartialEq, Debug, Clone)]
pub enum L1Expr<'a> {
    VarDef(VarDef<'a>),
    FnDef(FnDef<'a>),
    Expr(Expr<'a>),
}

impl<'a> L1Expr<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            | input: &'a str | { let (remnant, fndef) = FnDef::parse(input)?; Ok((remnant, L1Expr::FnDef(fndef))) },
            | input: &'a str | { let (remnant, vardef) = VarDef::parse(input)?; Ok((remnant, L1Expr::VarDef(vardef))) },
            | input: &'a str | { let (remnant, expr) = Expr::parse(input)?; Ok((remnant, L1Expr::Expr(expr))) },
        ))(input)
    }

}

impl<'a> Expr<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            | input: &'a str | { let (remnant, (_, _, expr, _, _)) = tuple((tag("("), multispace0, Expr::parse, multispace0, tag(")")))(input)?;
                Ok((remnant, Expr::Bracketed(Box::new(expr)))) },
            | input: &'a str | { let (remnant, (atom, _, _, _, index, _, _)) = tuple((Atom::parse, multispace0, tag("["), multispace0, Expr::parse, multispace0, tag("]")))(input)?; Ok((remnant, Expr::ArrayAccess(atom, Box::new(index))))},
            | input: &'a str | { let (remnant, ifelse) = IfElse::parse(input)?; Ok((remnant, Expr::IfElse(ifelse))) },
            | input: &'a str | { let (remnant, call) = Call::parse(input)?; Ok((remnant, Expr::Call(call))) },
            | input: &'a str | { let (remnant, (_, _, expr)) = tuple((tag("&"), multispace0, Expr::parse))(input)?; Ok((remnant, Expr::Reference(Box::new(expr)))) },
            | input: &'a str | { let (remnant, (_, _, expr)) = tuple((tag("*"), multispace0, Expr::parse))(input)?; Ok((remnant, Expr::Dereference(Box::new(expr)))) },
            | input: &'a str | { let (remnant, atom) = Atom::parse(input)?; Ok((remnant, Expr::Atom(atom))) },
        ))(input)
    }
}

mod tests {
    use crate::syntax::expr::{Expr, L1Expr};

    #[test]
    fn expr_parsing() {
        println!("aaa {:?}", L1Expr::parse("p = 8"))
    }
}
