use crate::lexer::{LexString, Lexer};

use super::{ty::Ty, Expr, ParserState, ParseResult, ExprVal, ParseError};

#[derive(Debug, Clone)]
pub struct VarDef<'a> {
    varname: LexString<'a>,
    ty: Ty,
}

impl<'a> VarDef<'a> {
    pub fn maybe_parse_raw(lexer: Lexer<'a>, e: Expr<'a>, state: ParserState) -> ParseResult<'a, Expr<'a>> {
        if let ExprVal::Variable(v) = &*e.val {
            lexer.eat_wsp();
            let s = lexer.peek_identifier().render();
            if s != "" && !state.data.read().unwrap().suffix_fns.contains(&s.to_string()) && !state.data.read().unwrap().infix_fns.contains_key(&s.to_string()) /* TODO: add other forms */ {
                lexer.take_identifier(); // eat it
                return Ok(Expr::new("unknown".to_string(), ExprVal::VarDef(VarDef { varname: v.name.clone(), ty: Ty { ty: s.to_string()}})))
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
