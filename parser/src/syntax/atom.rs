use nom::{IResult, branch::alt};

use super::{assign::Assign, fndecl::FnDecl, block::Block, literal::Literal, vardef::VarDef, variable::Variable};

#[derive(PartialEq, Debug, Clone)]
pub enum Atom<'a> {
    // Call(Call<'a>),
    Assign(Assign<'a>),
    VarDef(VarDef<'a>),
    FnDecl(FnDecl<'a>),
    Variable(Variable<'a>),
    Block(Block<'a>),
    Literal(Literal),
}
// impl<'a> Into<Atom<'a>> for Atom<'a> {
//     fn into(self) -> Atom<'a> {
//         Atom::Atom(self)
//     }
// }

impl<'a> Atom<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            // | input: &'a str | { let (remnant, call) = Call::parse(input)?; Ok((remnant, Atom::Call(call))) }, // TODO: fix this
            | input: &'a str | { let (remnant, assign) = Assign::parse(input)?; Ok((remnant, Atom::Assign(assign))) },
            | input: &'a str | { let (remnant, vardef) = VarDef::parse(input)?; Ok((remnant, Atom::VarDef(vardef))) },
            | input: &'a str | { let (remnant, block) = Block::parse(input)?; Ok((remnant, Atom::Block(block))) },
            | input: &'a str | { let (remnant, fndecl) = FnDecl::parse(input)?; Ok((remnant, Atom::FnDecl(fndecl))) },
            | input: &'a str | { let (remnant, id) = Variable::parse(input)?; Ok((remnant, Atom::Variable(id))) },
            | input: &'a str | { let (remnant, literal) = Literal::parse(input)?; Ok((remnant, Atom::Literal(literal))) },
        ))(input)
    }
}

// mod tests {
//     use crate::syntax::atom::Atom;
//
//     #[test]
//     fn atom_parsing() {
//         println!("{:?}", Atom::parse("{}"))
//     }
// }
