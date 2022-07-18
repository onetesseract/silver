
use crate::lexer::Lexer;

use super::{ParserState, ParseResult, ParseError, proto::FnProto, vardef::VarDef, template::Template};

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub struct Ty<'a> {
    pub val: TypeVariants<'a>,
    pub template: Option<Template<'a>>,
}
impl<'a> Ty<'a> {
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Self> {
        let template = if lexer.peek_char().render() == "<" {
            Some(Template::parse(lexer.clone(), state.clone())?)
        } else { None };
        lexer.eat_wsp();
        match lexer.peek_char().render().as_str() {
            "&" => {
                lexer.take_char();
                Ok(Ty {val: TypeVariants::PtrTo(Box::new(Ty::parse(lexer, state)?)), template})
            }
            "{" => {
                lexer.take_char();
                let mut members = vec![];
                loop {
                    lexer.eat_wsp();
                    if lexer.peek_char().render() == "}" {
                        break;
                    }
                    members.push(VarDef::parse_raw(lexer.clone(), state.clone())?);
                    lexer.eat_wsp();
                    if lexer.peek_char().render() == "}" {
                        break;
                    }
                    if lexer.peek_char().render() != "," {
                        return Err(ParseError::new(lexer.clone(), format!("Expected `,` or `{{` in struct-def but found {}", lexer.peek_char().render())))
                    }
                    lexer.take_char();
                }
                lexer.take_char(); // eat the }
                Ok(Ty {val: TypeVariants::Struct(members), template})
            }
            _ => {
                let name = lexer.peek_identifier();

                if name.render() == "" {
                    let proto = FnProto::parse(lexer, state)?;
                    Ok(Ty {val: TypeVariants::FnTy(Box::new(proto)), template})
                } else {
                    lexer.take_identifier();
                    lexer.eat_wsp();

                    // TODO: function parsing

                    // if lexer.peek_char().render() == "(" {
                    //     // oh its a thing whatsit
                    //     // fn proto but named first
                    //     let proto = FnProto::parse_normal_named(lexer, state, name)?;
                    //     Ok(Ty {val: TypeVariants::FnTy(Box::new(proto)), template})
                    // } else {
                        Ok(Ty {val: TypeVariants::Plain(name.render()), template})
                    // }
                }
            }
        }
    }
}

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub enum TypeVariants<'a> {
    Plain(String),
    PtrTo(Box<Ty<'a>>),
    Struct(Vec<VarDef<'a>>),
    FnTy(Box<FnProto<'a>>),
}
