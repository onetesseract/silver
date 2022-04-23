use nom::{IResult, sequence::tuple, character::complete::multispace0, combinator::opt, bytes::complete::tag, branch::alt, multi::many0};

use super::{identifier::Identifier, vardef::VarDef, expr::Expr, fndef::FnDef};

#[derive(PartialEq, Debug, Clone)]
pub struct StructDef<'a> {
    pub name: Identifier<'a>,
    pub members: Vec<StructMember<'a>>,
    pub functions: Vec<StructFunction<'a>>,
}

impl<'a> StructDef<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
       let (remnant, (name, _, _, _, values, _)) = tuple((Identifier::parse, multispace0, tag("{"), multispace0, many0(StructComponent::parse), tag("}")))(input)?;
       let mut members = vec![];
       let mut functions = vec![];
       for i in values {
           match i {
            StructComponent::Member(member) => members.push(member),
            StructComponent::Function(function) => functions.push(function),
        }
       }
       Ok((remnant, StructDef { name, members, functions}))
   }
}

#[derive(PartialEq, Debug, Clone)]
pub enum StructComponent<'a> {
    Member(StructMember<'a>),
    Function(StructFunction<'a>),
}
impl<'a> StructComponent<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            | input: &'a str | { let (remnant, memb) = StructMember::parse(input)?; Ok((remnant, StructComponent::Member(memb))) },
            | input: &'a str | { let (remnant, func) = StructFunction::parse(input)?; Ok((remnant, StructComponent::Function(func))) },
        ))(input)
    }
}

#[derive(PartialEq, Debug, Clone)]
pub struct StructMember<'a> {
    pub vardef: VarDef<'a>,
    pub value: Option<Expr<'a>>,
}

impl<'a> StructMember<'a> {
   pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
       let (remnant, (vardef, _, value, _, _, _)) = tuple((VarDef::parse, multispace0, opt(tuple((tag("="), multispace0, Expr::parse))), multispace0, tag(";"), multispace0))(input)?;
       let value = match value {
           Some((_, _, value)) => Some(value),
           None => None,
       };
       Ok((remnant, StructMember {vardef, value}))
   }
}

// BIG TODO: make tl more like this
#[derive(PartialEq, Debug, Clone)]
pub struct StructFunction<'a> {
    pub fndef: FnDef<'a>,
    pub body: Option<Expr<'a>>,
}

impl<'a> StructFunction<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
       let (remnant, (fndef, _, body, _, _, _)) = tuple((FnDef::parse, multispace0, opt(tuple((tag("="), multispace0, Expr::parse))), multispace0, tag(";"), multispace0))(input)?;
       let body = match body {
           Some((_, _, body)) => Some(body),
           None => None,
       };
       Ok((remnant, StructFunction {fndef, body}))
   }
}

mod tests {
    use crate::syntax::structdef::StructDef;

    #[test]
    fn struct_def() {
        println!("struct {:#?}", StructDef::parse(r#"string {
  buf &u8;
  self &string =(other &string) = printf("not impl kekw");
};"#))
    }
}
