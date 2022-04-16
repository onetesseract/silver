use nom::{multi::separated_list0, sequence::tuple, bytes::complete::tag, character::complete::multispace0, IResult, combinator::opt, branch::alt};

use super::{vardef::VarDef, ty::Type, identifier::Identifier};

#[derive(PartialEq, Debug, Clone)]
pub struct FnDef<'a> {
    pub proto: FnProto<'a>,
    pub name: Identifier<'a>,
    pub upon: Option<VarDef<'a>>,
}

#[derive(PartialEq, Debug, Clone)]
pub struct FnProto<'a> {
    pub return_type: Option<Type<'a>>,
    pub args: Vec<VarDef<'a>>,
}

impl<'a> FnProto<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> { // TODO: return types
        let (remnant, (_, _, args, _, _, _, return_type)) = tuple((tag("("), multispace0, separated_list0(tuple((multispace0, tag(","), multispace0)), VarDef::parse), multispace0, tag(")"), multispace0, opt(Type::parse)))(input)?;
        Ok((remnant, FnProto {args, return_type}))
    }
}

impl<'a> FnDef<'a> {
    fn parse_with_upon(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (upon, _, name, _, proto)) = tuple((VarDef::parse, multispace0, Identifier::parse, multispace0, FnProto::parse))(input)?;
        Ok((remnant, FnDef {proto, name, upon: Some(upon)}))
    }
    fn parse_no_upon(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (name, _, proto)) = tuple((Identifier::parse, multispace0, FnProto::parse))(input)?;
        Ok((remnant, FnDef {proto, name, upon: None}))
    }
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((FnDef::parse_with_upon, FnDef::parse_no_upon))(input)
    }
}
//
// mod tests {
//     use nom::{multi::separated_list0, bytes::complete::tag, character::complete::multispace0, sequence::tuple};
//
//     use crate::syntax::{fndef::{FnDef, FnProto}, vardef::VarDef};
//
//     #[test]
//     fn fndecl_parsing() {
//         // println!("{:?}", FnProto::parse(r#"(a str, b str) baa"#));
//         // println!("{:?}", separated_list0(tuple((multispace0, tag(","), multispace0)), VarDef::parse)("a str,b str,c str"))
//         println!("{:?}", FnDef::parse("self class plus(other class)"))
//     }
// }
