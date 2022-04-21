use nom::{IResult, branch::alt};

use super::{block::Block, literal::Literal, identifier::Identifier};

// TODO: move Bracketed to here
#[derive(PartialEq, Debug, Clone)]
pub enum Atom<'a> {
    Identifier(Identifier<'a>),
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
            // | input: &'a str | { let (remnant, call) = Call::parse(input)?; Ok((remnant, Atom::Call(call))) }, // TODO: fix thi
            | input: &'a str | { let (remnant, block) = Block::parse(input)?; Ok((remnant, Atom::Block(block))) },
            | input: &'a str | { let (remnant, literal) = Literal::parse(input)?; Ok((remnant, Atom::Literal(literal))) },
            | input: &'a str | { let (remnant, id) = Identifier::parse(input)?; Ok((remnant, Atom::Identifier(id))) },
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
