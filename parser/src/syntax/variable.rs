use crate::lexer::{LexString, Lexer};

use super::{Expr, ExprVal, ParseResult, call::CallExpr, ParserState};

#[derive(Debug, Clone)]
pub struct VariableExpr<'a> {
    pub name: LexString<'a>
}

impl<'a> VariableExpr<'a> {
    pub fn parse_raw(lexer: Lexer<'a>) -> Self {
        VariableExpr { name: lexer.take_identifier() }
    }
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<Expr> {
        let v = Self::parse_raw(lexer.clone());
        lexer.eat_wsp();
        if lexer.peek_char().render() == "(" {
            Ok(Expr::new("unknown".to_string(), ExprVal::Call(CallExpr::parse_raw(lexer, v, state)?)))
        } else {
            Ok(Expr::new("unknown".to_string(), ExprVal::Variable(v)))
        }
    }
}
