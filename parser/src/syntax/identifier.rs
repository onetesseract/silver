use nom::{IResult, combinator::recognize, sequence::pair, branch::alt, character::complete::{alpha1, alphanumeric1}, bytes::complete::tag, multi::many0_count};

#[derive(PartialEq, Debug, Clone)]
pub struct Identifier<'a> {
    pub name: &'a str,
}
impl<'a> Identifier<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, name) = recognize(
            pair(
                alt((alpha1, tag("_"))),
                many0_count(alt((alphanumeric1, tag("_"))))
            )
        )(input)?;
        Ok((remnant, Identifier {name}))
    }
}
// impl<'a> From<Identifier<'a>> for Atom<'a> {
//     fn from(val: Identifier<'a>) -> Self {
//         Atom::Identifier(val)
//     }
// }
