use crate::lexer::{LexString, Lexer};

use super::{Expr, ParseResult, ParserState, ParseError, ExprVal};

#[derive(Debug, Clone)]
pub struct ReturnExpr<'a> {
    pub raw: LexString<'a>,
    pub val: Expr<'a>,
}

impl<'a> ReturnExpr<'a> {
    pub fn parse(lexer: Lexer<'a>, state: ParserState, kwd: LexString<'a>) -> ParseResult<'a, Expr<'a>> {
        lexer.take_identifier();

        if kwd.render() != "return" {
            return Err(ParseError::new(lexer, format!("Expected `return`, got `{}`", kwd.render())));
        }

        let val = Expr::parse(lexer.clone(), state.clone())?;

        Ok(Expr { val: Box::new(ExprVal::ReturnExpr(ReturnExpr { raw: kwd, val }))})
    }
}
