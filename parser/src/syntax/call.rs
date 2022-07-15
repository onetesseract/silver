use crate::lexer::Lexer;

use super::{variable::VariableExpr, Expr, ParseResult, ParseError, ParserState, ty::Ty};

#[derive(Debug, Clone)]
pub struct CallExpr<'a> {
    pub target: VariableExpr<'a>,
    pub inputs: Vec<Expr<'a>>,
    pub types: Option<Vec<Ty<'a>>>,
    pub calltype: CallType,
}

#[derive(Debug, Clone)]
pub enum CallType {
    Prefix,
    Suffix,
    Normal,
    Infix,
}

impl<'a> CallExpr<'a> {
    pub fn parse_raw(lexer: Lexer<'a>, target: VariableExpr<'a>, state: ParserState) -> ParseResult<'a, Self> {
        let c = lexer.peek_char().render();

        let types = match c.as_str() {
            "(" => None,
            "<" => {
                lexer.take_char(); // eat <
                let mut types = vec![];
                if lexer.peek_char().render().as_str() != ">" {
                    loop {
                        types.push(Ty::parse(lexer.clone(), state.clone())?);
                        lexer.eat_wsp();
                        if lexer.peek_char().render().as_str() == ">" {
                            break;
                        }
                        if lexer.peek_char().render().as_str() != "," {
                            return Err(ParseError::new(lexer, format!("Expected , to separate template params")));
                        }
                        lexer.take_char(); // eat ,
                        lexer.eat_wsp();
                    }
                    lexer.take_char(); // eat >
                }
                Some(types)
            }
            _ => return Err(ParseError::new(lexer, format!("Expected ( in call, found {}", c)))
        };
        
        lexer.eat_wsp();
        let mut inputs: Vec<Expr> = vec![];
        let c = lexer.peek_char().render();
        if c.as_str() != "(" {
            return Err(ParseError::new(lexer, format!("Expected `(` to initiate call, got {}", c)))
        }
        lexer.take_char();
        if lexer.peek_char().render().as_str() != ")" {
            loop {
                inputs.push(Expr::parse(lexer.clone(), state.clone())?);
                lexer.eat_wsp();
                if lexer.peek_char().render().as_str() == ")" {
                    break;
                }
                if lexer.peek_char().render().as_str() != "," {
                    println!("{}", lexer.peek_char().render());
                    return Err(ParseError::new(lexer, format!("Expected , to separate args")));
                }
                lexer.take_char(); // eat ,
            }
        }
        // eat the )
        lexer.take_char();
        Ok(CallExpr { target, inputs, types, calltype: CallType::Normal })
    }
}
