use std::collections::HashMap;

use crate::lexer::{LexString, Lexer};

use super::{ParserState, ParseResult, ParseError, proto::FnProto, vardef::VarDef};
//
// #[derive(Debug, Clone)]
// pub struct Ty<'a> {
//     pub ty: LexString<'a>,
// }
//
// impl<'ctx> Ty<'ctx> {
//     pub fn parse(lexer: Lexer<'ctx>, state: ParserState) -> ParseResult<'ctx, Self> {
//         let possible_type = lexer.peek_identifier();
//         let s = possible_type.render();
//         if s != "" && !state.data.read().unwrap().suffix_fns.contains(&s.to_string()) && !state.data.read().unwrap().infix_fns.contains_key(&s.to_string()) /* TODO: add other forms */ {
//             lexer.take_identifier(); // eat it
//             Ok(Ty { ty: possible_type })
//         } else {
//             return Err(ParseError::new(lexer, format!("{} is not a type.", s)))
//         }
//
//     }
// }

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub struct Ty<'a> {
    pub val: TypeVariants<'a>,
}
impl<'a> Ty<'a> {
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Self> {
        lexer.eat_wsp();
        match lexer.peek_char().render() {
            "&" => {
                lexer.take_char();
                Ok(Ty {val: TypeVariants::PtrTo(Box::new(Ty::parse(lexer, state)?))})
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
                Ok(Ty {val: TypeVariants::Struct(members)})
            }
            _ => {
                let name = lexer.peek_identifier();

                if name.render() == "" {
                    let proto = FnProto::parse(lexer, state)?;
                    Ok(Ty {val: TypeVariants::FnTy(Box::new(proto))})
                } else {
                    lexer.take_identifier();
                    lexer.eat_wsp();

                    if lexer.peek_char().render() == "(" {
                        // oh its a thing whatsit
                        // fn proto but named first
                        let proto = FnProto::parse_normal_named(lexer, state, name)?;
                        Ok(Ty {val: TypeVariants::FnTy(Box::new(proto))})
                    } else {
                        Ok(Ty {val: TypeVariants::Plain(name.render())})
                    }
                }
            }
        }
    }
}

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub enum TypeVariants<'a> {
    Plain(&'a str),
    PtrTo(Box<Ty<'a>>),
    Struct(Vec<VarDef<'a>>),
    FnTy(Box<FnProto<'a>>),
}
