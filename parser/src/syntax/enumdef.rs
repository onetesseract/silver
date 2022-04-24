use nom::{IResult, sequence::tuple, character::complete::multispace0, bytes::complete::tag, multi::many0};

use super::identifier::Identifier;

#[derive(PartialEq, Debug, Clone)]
pub struct EnumDef<'a> {
    pub name: Identifier<'a>,
    pub members: Vec<Identifier<'a>>,
}

impl<'a> EnumDef<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (name, _, _, _, _, _, members, _)) = tuple((Identifier::parse, multispace0, tag("enum"), multispace0, tag("{"), multispace0, many0(tuple((Identifier::parse, multispace0, tag(";"), multispace0))), tag("}")))(input)?;
        let mut values = vec![];
        for (i, _, _, _) in members {
            values.push(i);
        }
        Ok((remnant, EnumDef{ name, members: values }))
    }
}
