use crate::lexer::{LexString, Lexer};

use super::{Expr, ParseResult, ParserState, ParseError, ExprVal};

#[derive(Debug, Clone)]
pub struct WhileLoop<'a> {
    pub raw: LexString<'a>,
    pub condition: Expr<'a>,
    pub body: Expr<'a>,
}

impl<'a> WhileLoop<'a> {
    pub fn parse(lexer: Lexer<'a>, state: ParserState, kwd: LexString<'a>) -> ParseResult<'a, Expr<'a>> {
        if kwd.render() != "while" {
            return Err(ParseError::new(lexer, format!("Expected `while`, got `{}`", kwd.render())));
        }

        let condition = Expr::parse(lexer.clone(), state.clone())?;
        let body = Expr::parse(lexer, state)?;

        Ok(Expr { val: Box::new(ExprVal::WhileLoop(WhileLoop{ raw: kwd, condition, body })) })
    }
}
