use crate::lexer::{Lexer, LexString};

use super::{Expr, ExprVal, ParseResult};

#[derive(Debug, Clone)]
pub struct NumberExpr<'a> {
    pub value: LexString<'a>,
}

impl<'a> NumberExpr<'a> {
    pub fn parse_raw(lexer: Lexer<'a>) -> Self {
        NumberExpr { value: lexer.take_number() }
    }
    pub fn parse(lexer: Lexer<'a>) -> ParseResult<Expr> {
        Ok(Expr::new(ExprVal::Number(Self::parse_raw(lexer))))
    }
}
