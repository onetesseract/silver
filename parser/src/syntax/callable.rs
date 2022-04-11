use nom::{IResult, branch::alt};

use super::{identifier::Identifier, literal::Literal, atom::Atom, block::Block, fndecl::FnDecl};

#[derive(PartialEq, Debug, Clone)]
pub enum Atom<'a> {

}
impl<'a> From<Atom<'a>> for Atom<'a> {
    fn from(val: Atom<'a>) -> Self {
        Atom::Callable(val)
    }
}
impl<'a> Atom<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((

        ))(input)
    }
}
