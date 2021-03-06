use std::collections::HashMap;

use crate::lexer::{Lexer, LexString};

use super::{ParseResult, ParseError};


#[derive(Debug, Clone)]
pub struct Hints<'a> {
    pub hints: HashMap<String, Vec<LexString<'a>>>,
}

impl<'a> Hints<'a> {
    pub fn parse(lexer: Lexer<'a>) -> ParseResult<'a, Self> {
        match lexer.take_char().render().as_str() {
            "#" => (),
            x => return Err(ParseError::new(lexer, format!("Expected # for a hint, got {}", x))),
        }
        lexer.eat_wsp();

        let mut hints = HashMap::new();
        loop {
            let hint_name = lexer.take_identifier();
            lexer.eat_wsp();
            let mut hint_values: Vec<LexString<'a>> = vec![];
            while lexer.peek_char().render() != "," {
                hint_values.push(lexer.take_while(| c: char | c.is_alphanumeric()));
                lexer.eat_wsp();
                if lexer.peek_char().render() == ";" || lexer.is_eof() {
                    hints.insert(hint_name.render(), hint_values);
                    lexer.take_char();
                    return Ok(Hints { hints })
                }
            }
            lexer.take_char(); // eat the ,
            lexer.eat_wsp();

            hints.insert(hint_name.render(), hint_values);
        }
    }

    pub fn get_bool(&self, key: &str) -> Option<Option<bool>> {
        match self.hints.get(key) {
            Some(s) => Some({
                if s.len() == 0 {
                    Some(true)
                } else {
                    match s[0].render().to_lowercase().as_str() {
                        "true" => Some(true),
                        "false" => Some(false),
                        _ => None
                    }
                }
            }),
            None => None
        }
    }
}
