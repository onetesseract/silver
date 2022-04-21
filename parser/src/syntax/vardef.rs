use nom::{IResult, sequence::tuple, character::complete::multispace0};

use super::{ty::Type, identifier::Identifier};

#[derive(PartialEq, Debug, Clone)]
pub struct VarDef<'a> {
    pub variable: Identifier<'a>,
    pub ty: Type<'a>,
}

impl<'a> VarDef<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (variable, _, ty)) = tuple((Identifier::parse, multispace0, Type::parse))(input)?;
        Ok((remnant, VarDef { ty, variable }))
    }
}

// #[derive(PartialEq, Debug, Clone)]
// pub enum PossiblyTypedVariable<'a> {
//     Typed(VarDef<'a>),
//     Untyped(Variable<'a>),
// }
// impl<'a> PossiblyTypedVariable<'a> {
//     pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
//         alt((
//             | input: &'a str | { let (remnant, vardef) = VarDef::parse(input)?; Ok((remnant, PossiblyTypedVariable::Typed(vardef))) },
//             | input: &'a str | { let (remnant, variable) = Variable::parse(input)?; Ok((remnant, PossiblyTypedVariable::Untyped(variable))) },
//         ))(input)
//     }
// }

// mod tests {
//     use crate::syntax::vardef::VarDef;
//
//     // #[test] - WORKS
//     // fn vardef_parsing() {
//     //     // assert_eq!(VarDef::parse("aa e").unwrap(), VarDef {ty: Some(Type {name: Identifier {name: "e"}}), variable: Identifier {name: "aa"}})
//     //     println!("{:?}", VarDef::parse("aa dd"));
//     // }
// }
