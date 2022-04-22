use nom::{IResult, character::is_alphabetic, bytes::complete::take_while1, combinator::fail};

use crate::RESERVED;

#[derive(PartialEq, Debug, Clone)]
pub struct Identifier<'a> {
    pub name: &'a str,
    // phantom: PhantomData<&'a str>,
}
impl<'a> Identifier<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, name) = take_while1(is_valid_esc)(input)?;
        if RESERVED.contains(&name) {
            return fail(input);
        }
        Ok((remnant, Identifier { name }))
        // parse_id(input)
    }
}

fn is_valid_id(input: char) -> bool {
    return is_alphabetic(input as u8) ||  "!£$%^~#@'-_+<>/|1234567890".contains(input)
}

fn is_valid_esc(input: char) -> bool {
    return is_alphabetic(input as u8) ||  "!£$%^~#@'-_+<>/|1234567890=".contains(input)
}

// fn parse_id<'a>(input: &'a str) -> IResult<&'a str, Identifier<'a>> {
//     if input.len() > 0 && !is_valid_id(input.chars().nth(0).unwrap()) && input.chars().nth(0).unwrap() != '\\' {
//         return fail(input);
//     }
//     let (remnant, first): (&str, &str) = take(1 as usize)(input)?;
//     if first != "\\" {
//         let (remnant, name) =
//                 take_while(is_valid_id)(remnant)?;
//         let name = name.to_string();
//         let first = first.to_string();
//         Ok((remnant, Identifier {name: first + &name, phantom: PhantomData}))
//     } else {
//         let (remnant, name) =
//                 take_while1(is_valid_esc)(remnant)?;
//         let name = name.to_string();
//         Ok((remnant, Identifier {name: name, phantom: PhantomData}))
//
//     }
//     // match take(0 as usize)(input) {}
// }
// impl<'a> From<Identifier<'a>> for Atom<'a> {
//     fn from(val: Identifier<'a>) -> Self {
//         Atom::Identifier(val)
//     }
// }
//
mod tests {
    use crate::syntax::identifier::Identifier;

    #[test]
    fn id_parsing() {
        println!("id-parsing {:?}", Identifier::parse("+"));
    }
}
