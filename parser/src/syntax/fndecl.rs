use nom::{multi::many0, sequence::tuple, bytes::complete::tag, character::complete::multispace0, IResult};

use super::{vardef::VarDef, expr::Expr};

#[derive(PartialEq, Debug, Clone)]
pub struct FnDecl<'a> {
    pub args: Vec<VarDef<'a>>,
    pub body: Box<Expr<'a>>,
}

impl<'a> FnDecl<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> { // TODO: return types
        let (remnant, (_, _, args_vec, _, _, body)) = tuple((tag("("), multispace0, many0(tuple((VarDef::parse, multispace0, tag(","), multispace0))), tag(")"), multispace0, Expr::parse))(input)?;
        let mut args = vec![];
        for (i, _, _, _) in args_vec {
            args.push(i);
        }
        Ok((remnant, FnDecl {args, body: Box::new(body)}))
    }
}

// mod tests {
//     use crate::syntax::fndecl::FnDecl;
//
//     #[test]
//     fn fndecl_parsing() {
//         println!("{:?}", FnDecl::parse(r#"() {}"#))
//     }
// }
