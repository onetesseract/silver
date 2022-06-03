use crate::lexer::Lexer;

use super::{variable::VariableExpr, Expr, ParseResult, ParseError, ParserState};

#[derive(Debug, Clone)]
pub struct CallExpr<'a> {
    pub target: VariableExpr<'a>,
    pub inputs: Vec<Expr<'a>>,
}

impl<'a> CallExpr<'a> {
    pub fn parse_raw(lexer: Lexer<'a>, target: VariableExpr<'a>, state: ParserState) -> ParseResult<'a, Self> {
        let c = lexer.take_char().render();
        if c != "(" {
            return Err(ParseError::new(lexer, format!("Expected ( in call, found {}", c)));
        }
        lexer.eat_wsp();
        let mut inputs: Vec<Expr> = vec![];
        if lexer.peek_char().render() != ")" {
            loop {
                inputs.push(Expr::parse(lexer.clone(), state.clone())?);
                lexer.eat_wsp();
                if lexer.peek_char().render() == ")" {
                    break;
                }
                if lexer.peek_char().render() != "," {
                    return Err(ParseError::new(lexer, format!("Expected , to separate args")));
                }
                lexer.take_char(); // eat ,
            }
        }
        // eat the )
        lexer.take_char();
        Ok(CallExpr { target, inputs })
    }
}
