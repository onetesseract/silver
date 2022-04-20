use nom::{IResult, multi::{many0, separated_list0}, character::complete::multispace0, bytes::complete::tag, sequence::tuple};

use super::expr::Expr;

#[derive(PartialEq, Debug, Clone)]
pub struct Block<'a> {
    pub exprs: Vec<Expr<'a>>,
}
impl<'a> Block<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (_, _, exprs_vec, _, _)) = tuple((tag("{"), multispace0, separated_list0(tuple((multispace0, tag(";"), multispace0)), Expr::parse), multispace0, tag("}")))(input)?;
        // let mut exprs = vec![];
        // for (i, _) in exprs_vec {
        //     exprs.push(i);
        // }
        Ok((remnant, Block { exprs: exprs_vec }))
    }
}
//
mod tests {
    use crate::syntax::block::Block;

    #[test]
    fn block_parsing() {
        println!("\n\nblock- {:?}", Block::parse(r#"{
  one u8;
  two u8;
  d \= (a + b);
  0
}"#));
    }
}
