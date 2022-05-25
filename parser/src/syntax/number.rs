use crate::lexer::{Lexer, LexString};

use super::{Expr, ExprVal, ParseResult};

#[derive(Debug, Clone)]
pub struct NumberExpr<'a> {
    value: LexString<'a>,
}

impl<'a> NumberExpr<'a> {
    pub fn parse_raw(lexer: Lexer<'a>) -> Self {
        NumberExpr { value: lexer.take_number() }
    }
    pub fn parse(lexer: Lexer<'a>) -> ParseResult<Expr> {
        Ok(Expr::new("number".to_string(), ExprVal::Number(Self::parse_raw(lexer))))
    }
}

mod tests {
    #[test]
    fn numberparsertest() {
        let l = crate::lexer::Lexer::new("9.6473");
        println!("{:?}", crate::syntax::number::NumberExpr::parse(l));
    }
}
