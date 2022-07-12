use crate::lexer::Lexer;

use super::{proto::FnProto, ty::Ty, ParserState, ParseResult, ParseError};


#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub struct Template<'ctx> {
    // proto: FnProto<'ctx>,
    pub params: Vec<TypeParam<'ctx>>,
}

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub struct TypeParam<'ctx> {
    pub name: Ty<'ctx>,
    limits: Vec<FnProto<'ctx>>,
}


impl<'ctx> TypeParam<'ctx> {
   pub fn parse(lexer: Lexer<'ctx>, state: ParserState) -> ParseResult<'ctx, Self> {
       let ty = Ty::parse(lexer.clone(), state.clone())?;

       lexer.eat_wsp();

       let mut limits = vec![];

       if lexer.peek_identifier().render() == "where" {
            // we got a where clause
            lexer.take_identifier(); // eat where
            lexer.eat_wsp();

            loop {
                if lexer.peek_char().render() == "," || lexer.peek_char().render() == ">" {
                    break;
                }
                limits.push(FnProto::parse(lexer.clone(), state.clone())?);

                lexer.eat_wsp();

                if lexer.peek_char().render() == "," || lexer.peek_char().render() == ">" {
                    break;
                }

                if lexer.peek_char().render() != "&" {
                    return Err(ParseError::new(lexer, format!("Expected & to separate template param limits")));
                }

                lexer.eat_wsp();
            }
       };

        Ok(TypeParam { name: ty, limits })
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
                lexer.eat_wsp();
            }
        }
        // eat the >
        lexer.take_char();

        Ok(Template { params: inputs })
    }
}

mod tests {
    #[test]
    fn templ_parsing() {
        let lexer = crate::lexer::Lexer::new("<t, t where somfunk() : vd>");
        println!("cfde {:#?}", crate::syntax::template::Template::parse(lexer, crate::syntax::ParserState::new()));
    }
}
