use crate::lexer::{LexString, Lexer};

use super::{Expr, ExprVal, ParseResult, ParserState, if_expr::IfExpr, ParseError};

pub const KEYWORDS: [&str; 3] = ["true", "false", "if"];


#[derive(Debug, Clone)]
pub struct Boolean<'a> {
    pub val: bool,
    pub raw: LexString<'a>,
}

pub fn parse_keywords<'a>(lexer: Lexer<'a>, state: ParserState, kwd: LexString<'a>) -> ParseResult<'a, Expr<'a>> {
    match kwd.render() {
        "true"  => Ok(Expr { val: Box::new(ExprVal::Boolean(Boolean { val: true, raw: kwd}))}),
        "false" => Ok(Expr { val: Box::new(ExprVal::Boolean(Boolean { val: false, raw: kwd}))}),
        "if" => IfExpr::parse(lexer, state, kwd),
        _ => return Err(ParseError::new(lexer, format!("Unknown keyword {}", kwd.render())))
    }
}
