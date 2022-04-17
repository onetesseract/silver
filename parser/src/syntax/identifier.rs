use nom::{IResult, character::is_alphabetic, bytes::complete::take_while1};

#[derive(PartialEq, Debug, Clone)]
pub struct Identifier<'a> {
    pub name: &'a str,
}
impl<'a> Identifier<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, name) =
                take_while1(is_valid_id)(input)?;
        Ok((remnant, Identifier {name}))
    }
}

fn is_valid_id(input: char) -> bool {
    return is_alphabetic(input as u8) ||  "!£$%^&*~#:@'-_+<>/\\|1234567890".contains(input)
}
// impl<'a> From<Identifier<'a>> for Atom<'a> {
//     fn from(val: Identifier<'a>) -> Self {
//         Atom::Identifier(val)
//     }
// }
//
// mod tests {
//     use crate::syntax::identifier::Identifier;
//
//     #[test]
//     fn id_parsing() {
//         println!("{:?}", Identifier::parse("eeee"));
//     }
// }
