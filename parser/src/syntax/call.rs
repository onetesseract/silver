use nom::{IResult, sequence::tuple, character::complete::multispace0, bytes::complete::tag, multi::{many1, separated_list0}, branch::alt};

// use crate::delim::delim;

use super::{expr::Expr, atom::Atom};

#[derive(PartialEq, Debug, Clone)]
pub struct Call<'a> {
    pub function: Box<Expr<'a>>,
    pub args: Vec<Expr<'a>>,
    pub is_infix: bool
}
impl<'a> Call<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((Call::parse_with_infix, Call::parse_with_brackets))(input)
    }
    fn parse_with_brackets(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (atom, _, mut calls_vec)) = tuple((Atom::parse, multispace0, many1(tuple((tag("("), multispace0,
        separated_list0(tuple((multispace0, tag(","), multispace0)), Expr::parse),
        multispace0, tag(")"), multispace0)))))(input)?;

        calls_vec.reverse();
        let mut call = Call {
            function: Box::new(Expr::Atom(atom)),
            args: calls_vec.pop().unwrap().2,
            is_infix: false,
        };
        for (_, _, args_vec, _, _, _) in calls_vec {
            call = Call {
                function: Box::new(Expr::Call(call)),
                args: args_vec,
                is_infix: false,
            }
        }
        Ok((remnant, call))
    }
    fn parse_with_infix(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (left, _, function, _, right)) = tuple((Atom::parse, multispace0, Atom::parse, multispace0, Atom::parse))(input)?;
        Ok((remnant, Call {function: Box::new(Expr::Atom(function)), args: vec![Expr::Atom(left), Expr::Atom(right)], is_infix: true}))
    }
}
//
// // TODO: maybe make it not copy every argument?
// fn args_vec_to_expr_vec<'a>(input: Vec<(Expr<'a>, &'a str, &'a str, &'a str)>) -> Vec<Expr<'a>> {
//     let mut exprs = vec![];
//     for (i, _, _, _) in input {
//         exprs.push(i.clone());
//     }
//     exprs
// }
//
// mod tests {
//     use crate::syntax::call::Call;
//
//     #[test]
//     fn call_parsing() {
//         println!("call-parse {:?}", Call::parse("self plus other"))
//     }
// }
