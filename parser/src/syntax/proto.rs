use crate::lexer::{LexString, Lexer};

use super::{ty::Ty, vardef::VarDef, ParserState, ParseResult, ParseError};

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub enum FnType {
    Infix,
    Suffix,
    Prefix,
    Upon,
}

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub struct FnProto<'a> {
    pub class: FnType,
    pub return_ty: Option<Ty<'a>>,
    pub name: LexString<'a>,
    pub args: Vec<VarDef<'a>>,
}

impl<'a> FnProto<'a> {
    pub fn parse_brackets_argslist(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Vec<VarDef<'a>>> {
        let c = lexer.take_char().render();
        if c != "(" {
            return Err(ParseError::new(lexer, format!("Expected ( in fndef, found {}", c)));
        }
        lexer.eat_wsp();
        let mut args: Vec<VarDef> = vec![];
        if lexer.peek_char().render() != ")" {
            loop {
                args.push(VarDef::parse_raw(lexer.clone(), state.clone())?);
                lexer.eat_wsp();
                if lexer.peek_char().render() == ")" {
                    break;
                }
                if lexer.peek_char().render() != "," {
                    return Err(ParseError::new(lexer, format!("Expected , to separate args")));
                }
                lexer.take_char(); // eat ,
            }
        }
        // eat the (
        lexer.take_char();
        lexer.eat_wsp();

        return Ok(args);
    }

    pub fn parse_possible_rettype(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Option<Ty>> {
        lexer.eat_wsp();
        if lexer.peek_char().render() != ":" {
            return Ok(None)
        }
        lexer.take_char();
        lexer.eat_wsp();
        
        let ty = Ty::parse(lexer, state)?;
        return Ok(Some(ty))
    }

    pub fn parse_normal_named(lexer: Lexer<'a>, state: ParserState, name: LexString<'a>) -> ParseResult<'a, Self> {
        if name.render() == "" {
            return Err(ParseError::new(lexer, format!("Expected a valid function name")));
        }
        lexer.eat_wsp();

        let args = Self::parse_brackets_argslist(lexer.clone(), state.clone())?;
        let return_ty = Self::parse_possible_rettype(lexer, state)?;

        return Ok(FnProto {class: FnType::Prefix, return_ty, name, args})
    }

    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Self> {
        lexer.eat_wsp();
        if lexer.peek_char().render() != "(" {
            // it's going to be a normal fn yay
        
            let name = lexer.take_identifier();

            return Self::parse_normal_named(lexer, state, name);
        }
        // ight so its not a prefix, sadge
        lexer.take_char(); // eat (
        lexer.eat_wsp();

        let target = VarDef::parse_raw(lexer.clone(), state.clone())?;
        
        lexer.eat_wsp();

        if lexer.take_char().render() != ")" {
            return Err(ParseError::new(lexer, "Expected ) to close upon arg".to_string()));
        }
        lexer.eat_wsp();

        let is_upon = if lexer.peek_char().render() == "." { true } else { false };

        if is_upon { lexer.take_char(); }

        let fn_name = lexer.take_identifier();
        if fn_name.render() == "" {
            return Err(ParseError::new(lexer, "Expected a valid fn name".to_string()));
        }
        lexer.eat_wsp();

        if lexer.peek_char().render() != "(" {
            // it's a suffix method
            return Ok(FnProto { class: FnType::Suffix, return_ty: Self::parse_possible_rettype(lexer, state)?, name: fn_name, args: vec![target] })
        }

        let mut args = Self::parse_brackets_argslist(lexer.clone(), state.clone())?;
        args.insert(0, target);

        return Ok(FnProto { class: if is_upon {FnType::Upon} else {FnType::Infix}, return_ty: Self::parse_possible_rettype(lexer, state)?, name: fn_name, args });
    }
}
