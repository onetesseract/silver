use crate::lexer::{Lexer, LexString};

use super::{Expr, ExprVal, ParseResult};

#[derive(Debug, Clone)]
pub struct NumberExpr<'a> {
    pub value: LexString<'a>,
    pub width: Option<LexString<'a>>,
}

impl<'a> NumberExpr<'a> {
    pub fn parse_raw(lexer: Lexer<'a>) -> Self {
        let value = lexer.take_number();
        let width = if lexer.peek_char().render() == "_" {
            lexer.take_char();
            Some(lexer.take_number())
        } else { None };
        NumberExpr { value, width }
    }
    pub fn parse(lexer: Lexer<'a>) -> ParseResult<Expr> {
        Ok(Expr::new(ExprVal::Number(Self::parse_raw(lexer))))
    }
}
