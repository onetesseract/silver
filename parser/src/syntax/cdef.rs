use crate::lexer::{LexString, Lexer};

use super::{Expr, ParserState, ParseResult, ParseError, ExprVal};

/// Compiler Definition
/// for when u wanna do something funky
#[derive(Debug, Clone)]
pub struct CDef<'a> {
    pub name: LexString<'a>,
    pub inputs: Vec<Expr<'a>>,
}

impl<'a> CDef<'a> {
    pub fn parse_raw(lexer: Lexer<'a>, state: ParserState) -> ParseResult<Self> {
        if lexer.take_char().render() != "@" {
            return Err(ParseError::new(lexer, format!("Expected @ for macro")));
        }
        lexer.eat_wsp();
        let name = lexer.take_identifier();
        lexer.eat_wsp();

        if lexer.peek_char().render() != "(" {
            // just a #MACRO thing
            return Ok(CDef { name, inputs: vec![]})
        }

        lexer.take_char(); // eat (

        let mut inputs = vec![];
        if lexer.peek_char().render() != ")" {
            loop {
                inputs.push(Expr::parse(lexer.clone(), state.clone())?);

                lexer.eat_wsp();
                if lexer.peek_char().render() == ")" {
                    break;
                }
                if lexer.peek_char().render() != "," {
                    return Err(ParseError::new(lexer, "Expected a ,".to_string()));
                }
                lexer.take_char();
                lexer.eat_wsp();
            }
        }

        lexer.take_char(); // eat )

        Ok(CDef{name, inputs})
    }

    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<Expr> {
        Ok(Expr { val: Box::new(ExprVal::CDef(Self::parse_raw(lexer, state)?)) })
    }
}
// mod tests {
//     #[test]
//     fn cdef_parsing() {
//         let lexer = crate::lexer::Lexer::new("#AS(\"uuuu\")");
//         println!("cfde {:#?}", crate::syntax::cdef::CDef::parse(lexer, crate::syntax::ParserState::new()));
//     }
// }
