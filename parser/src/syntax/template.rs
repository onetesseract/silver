use crate::lexer::Lexer;

use super::{proto::FnProto, ty::Ty, ParserState, ParseResult, ParseError};

pub struct Template<'ctx> {
    proto: FnProto<'ctx>,
    params: Vec<TypeParam<'ctx>>,
}

pub struct TypeParam<'ctx> {
    name: Ty<'ctx>,
    limits: Vec<FnProto<'ctx>>,
}

impl<'ctx> TypeParam<'ctx> {
   pub fn parse(lexer: Lexer<'ctx>, state: ParserState) -> ParseResult<'ctx, Self> {
       let ty = Ty::parse(lexer, state);
       // GOT HERE
       todo!()
   }
}

impl<'ctx> Template<'ctx> {
    pub fn parse(lexer: Lexer<'ctx>, state: ParserState) -> ParseResult<'ctx, Self> {
        if lexer.peek_char().render() != "<" {
            return Err(ParseError::new(lexer, format!("Expected < to start template")));
        }
        lexer.take_char();

        lexer.eat_wsp();

        let mut inputs: Vec<TypeParam> = vec![];
        if lexer.peek_char().render() != ">" {
            loop {
                inputs.push(TypeParam::parse(lexer.clone(), state.clone())?);
                lexer.eat_wsp();
                if lexer.peek_char().render() == ">" {
                    break;
                }
                if lexer.peek_char().render() != "," {
                    return Err(ParseError::new(lexer, format!("Expected , to separate template params")));
                }
                lexer.take_char(); // eat ,
            }
        }
        // eat the >
        lexer.take_char();

        todo!()
    }
}
