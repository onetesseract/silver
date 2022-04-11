use nom::{IResult, multi::many0, character::complete::multispace0, bytes::complete::tag, sequence::tuple};

use super::expr::Expr;

#[derive(PartialEq, Debug, Clone)]
pub struct Block<'a> {
    pub exprs: Vec<Expr<'a>>,
}
impl<'a> Block<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (_, _, exprs_vec, _)) = tuple((tag("{"), multispace0, many0(tuple((Expr::parse, multispace0))), tag("}")))(input)?;
        let mut exprs = vec![];
        for (i, _) in exprs_vec {
            exprs.push(i);
        }
        Ok((remnant, Block { exprs }))
    }
}

// mod tests {
//     use crate::syntax::block::Block;
//
//     #[test]
//     fn block_parsing() {
//         println!("{:?}", Block::parse("{}"));
//     }
// }
