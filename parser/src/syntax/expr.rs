use nom::{IResult, branch::alt};

use super::{atom::Atom, call::Call, vardef::VarDef, fndef::FnDef};

#[derive(PartialEq, Debug, Clone)]
pub enum Expr<'a> {
    Call(Call<'a>),
    Atom(Atom<'a>),
    VarDef(VarDef<'a>),
    FnDef(FnDef<'a>),
}

impl<'a> Expr<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            | input: &'a str | { let (remnant, fndef) = FnDef::parse(input)?; Ok((remnant, Expr::FnDef(fndef))) },
            | input: &'a str | { let (remnant, call) = Call::parse(input)?; Ok((remnant, Expr::Call(call))) },
            | input: &'a str | { let (remnant, vardef) = VarDef::parse(input)?; Ok((remnant, Expr::VarDef(vardef))) },
            | input: &'a str | { let (remnant, atom) = Atom::parse(input)?; Ok((remnant, Expr::Atom(atom))) },
        ))(input)
    }
}

// mod tests {
//     use crate::syntax::expr::Expr;
//
//     // #[test]
//     // fn expr_parsing() {
//     //     println!("{:?}", Expr::parse("uu"))
//     // }
// }
