use crate::lexer::Lexer;

use super::{Expr, ParseResult, ParseError, ParserState, ExprVal};

#[derive(Debug, Clone)]
pub struct Block<'a> {
    pub exprs: Vec<Expr<'a>>,
    pub use_last_val: bool,
}

impl<'a> Block<'a> {
    pub fn parse_raw(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Self> {
        let c = lexer.take_char().render();
        if c.as_str() != "{" {
            return Err(ParseError::new(lexer, format!("Expected {{ to start block, found `{}`", c)));
        }
        lexer.eat_wsp();
        let mut exprs: Vec<Expr> = vec![];
        let mut use_last_val = false;
        if lexer.peek_char().render() != "}" {
            loop {
                exprs.push(Expr::parse(lexer.clone(), state.clone())?);
                lexer.eat_wsp();
                if lexer.peek_char().render().as_str() != ";" {
                    if lexer.peek_char().render().as_str() == "}" {
                        use_last_val = true;
                        break;
                    } else {
                        return Err(ParseError::new(lexer, format!("Expected ; to separate exprs")));
                    }
                }
                lexer.take_char(); // eat ;
                lexer.eat_wsp();

                if lexer.peek_char().render().as_str() == "}" {
                    break;
                }
            }
        }
        // let expr = Expr::parse(lexer.clone(), state)?;
        // lexer.eat_wsp();
        //
        let c = lexer.take_char().render();
        if c.as_str() != "}" {
            return Err(ParseError::new(lexer, format!("Expected }} to end block, found `{}`", c)));
        }        

        return Ok(Block { exprs, use_last_val })
    }
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Expr<'a>> {
        Ok(Expr::new(ExprVal::Block(Block::parse_raw(lexer, state)?)))
    }
}

