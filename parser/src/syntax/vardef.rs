use crate::{lexer::{LexString, Lexer}, syntax::template::Template};

use super::{ty::Ty, Expr, ParserState, ParseResult, ExprVal, ParseError, variable::VariableExpr};

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub struct VarDef<'a> {
    pub varname: LexString<'a>,
    pub ty: Ty<'a>,
}

impl<'a> VarDef<'a> {
    pub fn maybe_parse_raw(lexer: Lexer<'a>, e: Expr<'a>, state: ParserState) -> ParseResult<'a, Expr<'a>> {
        if let ExprVal::Variable(v) = &*e.val {
            println!("step 1");
            lexer.eat_wsp();

            if lexer.peek_char().render() == ":" {
                println!("step 2");
                lexer.take_char();
                lexer.eat_wsp();
            } else {
                return Ok(e);
            }

            let possible_type = lexer.peek_identifier();
            let s = possible_type.render();
            // TODO: unmess plz
            if (s != "" || lexer.peek_char().render() == "{") /* && !state.data.read().unwrap().suffix_fns.contains(&s.to_string()) && !state.data.read().unwrap().infix_fns.contains_key(&s.to_string()) */ /* TODO: add other forms */ {
                let ty = Ty::parse(lexer.clone(), state.clone())?;

                lexer.eat_wsp();

                if lexer.peek_char().render() == "<" {
                    // is template
                    let template = Template::parse(lexer, state)?;
                    let mut ty = ty;
                    ty.template = Some(template);
                    println!("Returning templ");
                    return Ok(Expr::new(ExprVal::VarDef(VarDef { varname: v.name.clone(), ty })))
                }

                println!("Returning normal");

                return Ok(Expr::new(ExprVal::VarDef(VarDef { varname: v.name.clone(), ty })))
            }
        }
        Ok(e)
    }
    pub fn parse_raw(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Self> {
        lexer.eat_wsp();
        let varname = VariableExpr::parse_raw(lexer.clone()).name;
        lexer.eat_wsp();
        if lexer.peek_char().render() != ":" {
            return Err(ParseError::new(lexer, format!("Expected : for vardef")));
        }
        lexer.take_char();
        lexer.eat_wsp();

        let ty = Ty::parse(lexer, state)?;

        Ok(VarDef {ty, varname} )
    }
}
