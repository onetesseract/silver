use crate::lexer::{LexString, Lexer};

use super::{ParserState, ParseResult, Expr, ParseError, ExprVal};

#[derive(Debug, Clone)]
pub struct StringExpr<'a> {
    pub rendered: String,
    pub begin: LexString<'a>,
}

impl<'a> StringExpr<'a> {
    pub fn parse(lexer: Lexer<'a>, _state: ParserState) -> ParseResult<'a, Expr> {
        let begin: LexString<'a> = lexer.take_char();
        if begin.render() != "\"" {
            return Err(ParseError::new(lexer, "Expected `\"`".to_string()));
        }

        let mut escaped = false;
        let mut s = vec![];
        loop {
            if escaped {
                s.push(lexer.take_char().render().as_bytes()[0] as char);
                escaped = false;
            }
            let c = lexer.take_char().render().as_bytes()[0] as char;
            if c == '"' {
                break;
            }
            if c == '\\' {
                escaped = true;
            } else {
                s.push(c);
            }
        }

        Ok(Expr { val: Box::new(ExprVal::String(StringExpr { rendered: s.iter().collect(), begin })) } )
    }
}
