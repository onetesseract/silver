use std::collections::HashMap;

use crate::lexer::{Lexer, LexString};

use super::{ParseResult, ParseError};


#[derive(Debug, Clone)]
pub struct Hints<'a> {
    pub hints: HashMap<&'a str, Vec<LexString<'a>>>,
}

impl<'a> Hints<'a> {
    pub fn parse(lexer: Lexer<'a>) -> ParseResult<'a, Self> {
        match lexer.take_char().render() {
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
}

mod tests {
    #[test]
    fn hints_parsing() {
        let lexer = crate::lexer::Lexer::new("#inline, linkage internal, poggers true;");
        println!("hints {:#?}", super::Hints::parse(lexer).unwrap());
    }
}
