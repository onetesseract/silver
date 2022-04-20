use nom::{IResult, branch::alt, character::complete::multispace0, sequence::tuple, bytes::complete::tag};

use super::identifier::Identifier;

#[derive(PartialEq, Debug, Clone)]
pub enum Variable<'a> {
    Reference(Box<Variable<'a>>),
    Dereference(Box<Variable<'a>>),
    Identifier(Identifier<'a>),
}
impl<'a> Variable<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            | input: &'a str | { let (remnant, (_, _, var)) = tuple((tag("&"), multispace0, Variable::parse))(input)?; Ok((remnant, Variable::Reference(Box::new(var)))) },
            | input: &'a str | { let (remnant, (_, _, var)) = tuple((tag("*"), multispace0, Variable::parse))(input)?; Ok((remnant, Variable::Dereference(Box::new(var)))) },
            | input: &'a str | { let (remnant, name) = Identifier::parse(input)?; Ok((remnant, Variable::Identifier(name))) }
        ))(input)
    }
}
