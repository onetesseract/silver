use nom::{IResult, character::complete::multispace0, sequence::tuple, bytes::complete::tag};

use super::{atom::Atom, expr::Expr, identifier::Identifier};

#[derive(PartialEq, Debug, Clone)]
pub struct StructAccess<'a> {
    pub root: Box<Atom<'a>>,
    pub access: Box<Expr<'a>>,
}

impl<'a> StructAccess<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (root, _, _, _, access)) = tuple((Identifier::parse, multispace0, tag("."), multispace0, Expr::parse_exc_infix))(input)?;
        Ok((remnant, StructAccess { root: Box::new(Atom::Identifier(root)), access: Box::new(access) }))
    }
}
