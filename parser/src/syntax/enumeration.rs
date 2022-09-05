use crate::lexer::{LexString, Lexer};

use super::{ParserState, ParseError, ParseResult, ty::Ty};

#[derive(Debug, Clone)]
pub struct Enum<'a> {
    pub name: Ty<'a>,
    pub variants: Vec<LexString<'a>>,
}

impl<'a> Enum<'a> {
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Self> {
        if lexer.take_identifier().render() != "enum" {
            return Err(ParseError::new(lexer, "Expected `enum`".to_string()))
        }
        lexer.eat_wsp();

        let name = Ty::parse(lexer.clone(), state)?;

        lexer.eat_wsp();

        if lexer.take_char().render() != "=" {
            return Err(ParseError::new(lexer, "Expected =".to_string()))
        }

        lexer.eat_wsp();

        if lexer.take_char().render() != "{" {
            return Err(ParseError::new(lexer, "Expected {".to_string()))
        }

        lexer.eat_wsp();

        let mut variants = vec![];
        if lexer.peek_char().render() != "}" {
            loop {
                variants.push(lexer.take_identifier());
                lexer.eat_wsp();
                if lexer.peek_char().render() == "}" {
                    break;
                }
                if lexer.take_char().render() != "," {
                    return Err(ParseError::new(lexer, "Expected ,".to_string()))
                }
                lexer.eat_wsp();
            }
        }
        lexer.take_char();

        Ok(Enum {name, variants})
    }
}
