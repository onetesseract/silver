use crate::lexer::{LexString, Lexer};

use super::{ParserState, ParseResult, ParseError};

#[derive(Debug, Clone)]
pub struct Ty<'a> {
    pub ty: LexString<'a>,
}

impl<'ctx> Ty<'ctx> {
    pub fn parse(lexer: Lexer<'ctx>, state: ParserState) -> ParseResult<'ctx, Self> {
        let possible_type = lexer.peek_identifier();
        let s = possible_type.render();
        if s != "" && !state.data.read().unwrap().suffix_fns.contains(&s.to_string()) && !state.data.read().unwrap().infix_fns.contains_key(&s.to_string()) /* TODO: add other forms */ {
            lexer.take_identifier(); // eat it
            Ok(Ty { ty: possible_type })
        } else {
            return Err(ParseError::new(lexer, format!("{} is not a type.", s)))
        }

    }
}
