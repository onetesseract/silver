use nom::{IResult, sequence::tuple, character::complete::multispace0, bytes::complete::tag, multi::{many0, many1}};

use super::{expr::Expr, atom::Atom};

#[derive(PartialEq, Debug, Clone)]
pub struct Call<'a> {
    pub function: Box<Expr<'a>>,
    pub args: Vec<Expr<'a>>,
}
impl<'a> Call<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (atom, _, mut calls_vec)) = tuple((Atom::parse, multispace0, many1(tuple((tag("("), multispace0, many0(tuple((Expr::parse, multispace0, tag(","), multispace0))), tag(")"), multispace0)))))(input)?;
        calls_vec.reverse();
        let mut call = Call {
            function: Box::new(Expr::Atom(atom)),
            args: args_vec_to_expr_vec(calls_vec.pop().unwrap().2),
        };
        for (_, _, args_vec, _, _) in calls_vec {
            call = Call {
                function: Box::new(Expr::Call(call)),
                args: args_vec_to_expr_vec(args_vec)
            }
        }
        Ok((remnant, call))
    }
}

// TODO: maybe make it not copy every argument?
fn args_vec_to_expr_vec<'a>(input: Vec<(Expr<'a>, &'a str, &'a str, &'a str)>) -> Vec<Expr<'a>> {
    let mut exprs = vec![];
    for (i, _, _, _) in input {
        exprs.push(i.clone());
    }
    exprs
}
