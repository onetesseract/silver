use nom::{IResult, branch::alt, bytes::complete::tag, sequence::tuple, character::complete::multispace0};

use super::{block::Block, literal::Literal, identifier::Identifier, expr::Expr, structaccess::StructAccess};

// TODO: move Bracketed to here
#[derive(PartialEq, Debug, Clone)]
pub enum Atom<'a> {
    Bracketed(Box<Expr<'a>>),
    Reference(Box<Expr<'a>>),
    Dereference(Box<Expr<'a>>),
    Identifier(Identifier<'a>),
    Block(Block<'a>),
    Literal(Literal),
    StructAccess(StructAccess<'a>),
}
// impl<'a> Into<Atom<'a>> for Atom<'a> {
//     fn into(self) -> Atom<'a> {
//         Atom::Atom(self)
//     }
// }

impl<'a> Atom<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            // | input: &'a str | { let (remnant, call) = Call::parse(input)?; Ok((remnant, Atom::Call(call))) }, // TODO: fix thi
            | input: &'a str | { let (remnant, (_, _, expr, _, _)) = tuple((tag("("), multispace0, Expr::parse, multispace0, tag(")")))(input)?; Ok((remnant, Atom::Bracketed(Box::new(expr)))) },
            | input: &'a str | { let (remnant, (_, _, expr)) = tuple((tag("*"), multispace0, Expr::parse))(input)?; Ok((remnant, Atom::Dereference(Box::new(expr)))) },
            | input: &'a str | { let (remnant, (_, _, expr)) = tuple((tag("&"), multispace0, Expr::parse))(input)?; Ok((remnant, Atom::Reference(Box::new(expr)))) },
            | input: &'a str | { let (remnant, block) = Block::parse(input)?; Ok((remnant, Atom::Block(block))) },
            | input: &'a str | { let (remnant, literal) = Literal::parse(input)?; Ok((remnant, Atom::Literal(literal))) },
            | input: &'a str | { let (remnant, access) = StructAccess::parse(input)?; Ok((remnant, Atom::StructAccess(access))) },
            | input: &'a str | { let (remnant, id) = Identifier::parse(input)?; Ok((remnant, Atom::Identifier(id))) },
        ))(input)
    }
}

// mod tests {
//     use crate::syntax::atom::Atom;
//
//     #[test]
//     fn atom_parsing() {
//         println!("{:?}", Atom::parse("{}"))
//     }
// }
