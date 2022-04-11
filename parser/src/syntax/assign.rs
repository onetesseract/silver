use nom::{sequence::tuple, character::complete::multispace0, IResult, bytes::complete::tag};

use super::{vardef::{VarDef, PossiblyTypedVariable}, atom::Atom, expr::Expr};

#[derive(PartialEq, Debug, Clone)]
pub struct Assign<'a> {
    pub target: PossiblyTypedVariable<'a>,
    pub value: Box<Expr<'a>>,
}

impl<'a> Assign<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> { // TODO: we can assign to more than this garbage
        let (remnant, (target, _, _, _, value)) = tuple((PossiblyTypedVariable::parse, multispace0, tag("="), multispace0, Expr::parse))(input)?;
        Ok((remnant, Assign {target, value: Box::new(value)}))
    }
}

impl<'a> From<Assign<'a>> for Atom<'a> {
    fn from(a: Assign<'a>) -> Self {
         Atom::Assign(a)
    }
}

// mod tests {
//     use crate::syntax::{assign::Assign, vardef::VarDef, identifier::Identifier, atom::Atom};
//
//     #[test]
//     fn assign_parsing() {
//         assert_eq!(
//             Assign::parse("aaa = bbb").unwrap(),
//             ("",
//             Assign {
//                 target: VarDef {
//                     variable: Identifier { name: "aaa" },
//                     ty: None,
//                 },
//                 value: Box::new(Atom::Identifier(Identifier {
//                     name: "bbb",
//                 }).into())
//             })
//         )
//     }
// }
