use crate::{lexer::{LexString, Lexer}, syntax::template::Template};

use super::{ty::Ty, Expr, ParserState, ParseResult, ExprVal, ParseError};

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub struct VarDef<'a> {
    pub varname: LexString<'a>,
    pub ty: Ty<'a>,
}

impl<'a> VarDef<'a> {
    pub fn maybe_parse_raw(lexer: Lexer<'a>, e: Expr<'a>, state: ParserState) -> ParseResult<'a, Expr<'a>> {
        if let ExprVal::Variable(v) = &*e.val {
            lexer.eat_wsp();

            if lexer.peek_char().render() == ":" {
                lexer.take_char();
                lexer.eat_wsp();
            } else {
                return Ok(e);
            }

            let possible_type = lexer.peek_identifier();
            let s = possible_type.render();
            // TODO: unmess plz
            if (s != "" || lexer.peek_char().render() == "{") && !state.data.read().unwrap().suffix_fns.contains(&s.to_string()) && !state.data.read().unwrap().infix_fns.contains_key(&s.to_string()) /* TODO: add other forms */ {
                let ty = Ty::parse(lexer.clone(), state.clone())?;

                lexer.eat_wsp();

                if lexer.peek_char().render() == "<" {
                    // is template
                    let template = Template::parse(lexer, state)?;
                    let mut ty = ty;
                    ty.template = Some(template);
                    return Ok(Expr::new(ExprVal::VarDef(VarDef { varname: v.name.clone(), ty })))
                }

                return Ok(Expr::new(ExprVal::VarDef(VarDef { varname: v.name.clone(), ty })))
            }
        }
        Ok(e)
    }
    pub fn parse_raw(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Self> {
        let val = Expr::parse_primary(lexer.clone(), state.clone())?;
        if let ExprVal::VarDef(v) = &*val.clone().val {
            Ok(v.clone())
        } else {
            return Err(ParseError::new(lexer, format!("Invalid vardef, found {:?}", val)))
        }
    }
}
