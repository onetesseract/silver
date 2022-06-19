use crate::lexer::{LexString, Lexer};

use super::{Expr, ParseResult, ParserState, ExprVal, ParseError};

#[derive(Debug, Clone)]
pub struct IfExpr<'a> {
    pub raw: LexString<'a>,
    pub condition: Expr<'a>,
    pub then: Expr<'a>,
    pub els: Option<Expr<'a>>,
}

impl<'a> IfExpr<'a> {
    pub fn parse(lexer: Lexer<'a>, state: ParserState, kwd: LexString<'a>) -> ParseResult<'a, Expr<'a>> {
        println!("parsing if here");
        if kwd.render() != "if" {
            return Err(ParseError::new(lexer, format!("Expected `if`, got `{}`", kwd.render())));
        }

        let condition = Expr::parse(lexer.clone(), state.clone())?;
        let then = Expr::parse(lexer.clone(), state.clone())?;

        lexer.eat_wsp();

        let els = if lexer.peek_identifier().render() == "else" {
            lexer.take_identifier();
            Some(Expr::parse(lexer, state)?)
        } else {
            None
        };

        Ok(Expr { val: Box::new(ExprVal::IfExpr(IfExpr{ raw: kwd, condition, then, els })) })
    }
}
