use crate::lexer::{LexString, Lexer};

use super::{Expr, ExprVal, ParseResult, ParserState, if_expr::IfExpr, ParseError, while_loop::WhileLoop, ret::ReturnExpr};

pub const KEYWORDS: [&str; 5] = ["true", "false", "if", "return", "while"];


#[derive(Debug, Clone)]
pub struct Boolean<'a> {
    pub val: bool,
    pub raw: LexString<'a>,
}

pub fn parse_keywords<'a>(lexer: Lexer<'a>, state: ParserState, kwd: LexString<'a>) -> ParseResult<'a, Expr<'a>> {
    match kwd.render().as_str() {
        "true"  => Ok(Expr { val: Box::new(ExprVal::Boolean(Boolean { val: true, raw: kwd}))}),
        "false" => Ok(Expr { val: Box::new(ExprVal::Boolean(Boolean { val: false, raw: kwd}))}),
        "if" => IfExpr::parse(lexer, state, kwd),
        "while" => WhileLoop::parse(lexer, state, kwd),
        "return" => ReturnExpr::parse(lexer, state, kwd),
        _ => return Err(ParseError::new(lexer, format!("Unknown keyword {}", kwd.render())))
    }
}
