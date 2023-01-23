use crate::lexer::{LexString, Lexer};

use super::{Expr, ExprVal, ParseError, ParseResult, ParserState};

#[derive(Debug, Clone)]
pub struct ReturnExpr<'a> {
    pub raw: LexString<'a>,
    pub val: Option<Expr<'a>>,
}

impl<'a> ReturnExpr<'a> {
    pub fn parse(
        lexer: Lexer<'a>,
        state: ParserState,
        kwd: LexString<'a>,
    ) -> ParseResult<'a, Expr<'a>> {
        lexer.take_identifier();

        if kwd.render() != "return" {
            return Err(ParseError::new(
                lexer,
                format!("Expected `return`, got `{}`", kwd.render()),
            ));
        }

        // URGENT TODO: make work

        lexer.eat_wsp();
        let char = lexer.peek_char().render();
        if char == ";" || char == "}" {
            return Ok(Expr {
                val: Box::new(ExprVal::ReturnExpr(ReturnExpr {
                    raw: kwd,
                    val: None,
                })),
            });
        };

        let val = Expr::parse(lexer.clone(), state.clone())?;

        Ok(Expr {
            val: Box::new(ExprVal::ReturnExpr(ReturnExpr {
                raw: kwd,
                val: Some(val),
            })),
        })
    }
}
