use nom::{IResult, sequence::tuple, character::complete::multispace0, bytes::complete::tag};

use super::{ty::Type, atom::Atom};

#[derive(PartialEq, Debug, Clone)]
pub struct Cast<'a> {
    pub target: Atom<'a>,
    pub ty: Type<'a>,
}

impl<'a> Cast<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        // TODO: nicer casting syntax
        let (remnant, (target, _, _, _, ty)) = tuple((Atom::parse, multispace0, tag("as"), multispace0, Type::parse))(input)?;
        Ok((remnant, Cast { target, ty }))
    }
}
