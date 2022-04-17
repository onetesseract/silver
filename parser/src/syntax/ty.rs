use nom::IResult;

use super::variable::Variable;

#[derive(PartialEq, Debug, Clone)]
pub struct Type<'a> {
    pub name: Variable<'a>,
}
impl<'a> Type<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, name) = Variable::parse(input)?;
        Ok((remnant, Type { name }))
    }
}
