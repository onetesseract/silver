use nom::IResult;

use super::identifier::Identifier;

#[derive(PartialEq, Debug, Clone)]
pub struct Type<'a> {
    pub name: Identifier<'a>,
}
impl<'a> Type<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, name) = Identifier::parse(input)?;
        Ok((remnant, Type { name }))
    }
}
