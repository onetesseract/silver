use nom::{IResult, sequence::tuple, character::complete::{multispace0, one_of}, branch::alt, bytes::complete::tag, combinator::{map_res, recognize}, multi::many1};

use crate::take_number;

use super::identifier::Identifier;

#[derive(PartialEq, Debug, Clone)]

pub enum Type<'a> {
    PtrTo(Box<Type<'a>>),
    ArrayOf(Box<Type<'a>>, usize),
    Name(Identifier<'a>),
}
impl<'a> Type<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            | input: &'a str | {
                let (remnant, (_, _, ty)) = tuple((tag("&"), multispace0, Type::parse))(input)?;
                Ok((remnant, Type::PtrTo(Box::new(ty))))
            },
            | input: &'a str | {
                let (remnant, (_, _, ty, _, _, _, count, _, _)) = tuple((tag("["), multispace0, Type::parse, multispace0, tag(":"), multispace0, take_number, multispace0, tag("]")))(input)?;
                Ok((remnant, Type::ArrayOf(Box::new(ty), count)))
            },
            | input: &'a str | { let (remnant, id) = Identifier::parse(input)?; Ok((remnant, Type::Name(id))) }
        ))(input)
    }
}

