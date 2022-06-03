use crate::lexer::Lexer;

use super::{Expr, ParseResult, ParseError, ParserState, ExprVal};

#[derive(Debug, Clone)]
pub struct Block<'a> {
    pub exprs: Vec<Expr<'a>>,
}

impl<'a> Block<'a> {
    pub fn parse_raw(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Self> {
        let c = lexer.take_char().render();
        if c != "{" {
            return Err(ParseError::new(lexer, format!("Expected {{ to start block, found {}", c)));
        }
        lexer.eat_wsp();
        let mut exprs: Vec<Expr> = vec![];
        if lexer.peek_char().render() != "}" {
            loop {
                exprs.push(Expr::parse(lexer.clone(), state.clone())?);
                lexer.eat_wsp();
                if lexer.peek_char().render() != ";" {
                    return Err(ParseError::new(lexer, format!("Expected ; to separate exprs")));
                }
                lexer.take_char(); // eat ;
                lexer.eat_wsp();

                if lexer.peek_char().render() == "}" {
                    break;
                }
            }
        }
        // eat the }
        lexer.take_char();

        return Ok(Block { exprs })
    }
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Expr<'a>> {
        Ok(Expr::new(ExprVal::Block(Block::parse_raw(lexer, state)?)))
    }
}

