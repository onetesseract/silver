use nom::{IResult, branch::alt, character::complete::multispace0, bytes::complete::tag, sequence::tuple};

use super::{atom::Atom, call::Call, vardef::VarDef, fndef::FnDef, ifelse::IfElse, cast::Cast};

#[derive(PartialEq, Debug, Clone)]
pub enum Expr<'a> {
    Call(Call<'a>),
    Cast(Cast<'a>),
    Atom(Atom<'a>),
    IfElse(IfElse<'a>),
    ArrayAccess(Atom<'a>, Box<Expr<'a>>),
    // StructAccess(StructAccess<'a>),
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
            | input: &'a str | { let (remnant, expr) = Expr::parse_exc_atom(input)?; Ok((remnant, L1Expr::Expr(expr))) },
            | input: &'a str | { let (remnant, vardef) = VarDef::parse(input)?; Ok((remnant, L1Expr::VarDef(vardef))) },
            | input: &'a str | { let (remnant, expr) = Expr::parse_atom(input)?; Ok((remnant, L1Expr::Expr(expr))) },
        ))(input)
    }}


impl<'a> Expr<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
                // easy TODO: clean up
            | input: &'a str | Expr::parse_exc_atom(input),
            // | input: &'a str | { let (remnant, vardef) = VarDef::parse(input)?; Ok((remnant, Expr::VarDef(vardef))) },
            | input: &'a str | Expr::parse_atom(input)
        ))(input)
    }
    fn parse_exc_atom(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            | input: &'a str | { let (remnant, cast) = Cast::parse(input)?; Ok((remnant, Expr::Cast(cast))) },
            | input: &'a str | { let (remnant, (atom, _, _, _, index, _, _)) = tuple((Atom::parse, multispace0, tag("["), multispace0, Expr::parse, multispace0, tag("]")))(input)?; Ok((remnant, Expr::ArrayAccess(atom, Box::new(index))))},
            | input: &'a str | { let (remnant, ifelse) = IfElse::parse(input)?; Ok((remnant, Expr::IfElse(ifelse))) },
            | input: &'a str | { let (remnant, call) = Call::parse(input)?; Ok((remnant, Expr::Call(call))) },
        ))(input)
    }
    fn parse_atom(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, atom) = Atom::parse(input)?;
        Ok((remnant, Expr::Atom(atom)))
    }

    // TODO: un-duplicate logic
    pub fn parse_exc_infix(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            | input: &'a str | { let (remnant, cast) = Cast::parse(input)?; Ok((remnant, Expr::Cast(cast))) },
            | input: &'a str | { let (remnant, (atom, _, _, _, index, _, _)) = tuple((Atom::parse, multispace0, tag("["), multispace0, Expr::parse, multispace0, tag("]")))(input)?; Ok((remnant, Expr::ArrayAccess(atom, Box::new(index))))},
            | input: &'a str | { let (remnant, ifelse) = IfElse::parse(input)?; Ok((remnant, Expr::IfElse(ifelse))) },
            | input: &'a str | { let (remnant, call) = Call::parse_with_brackets(input)?; Ok((remnant, Expr::Call(call))) },
            | input: &'a str | Expr::parse_atom(input)
        ))(input)

    }

}

mod tests {
    use crate::syntax::{expr::{Expr, L1Expr}, toplevel::TopLevelExpr};

    #[test]
    fn expr_parsing() {
        println!("aaa {:?}", Expr::parse("a.b()"))
    }
}
