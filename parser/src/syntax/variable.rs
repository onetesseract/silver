use crate::lexer::{LexString, Lexer};

use super::{Expr, ExprVal, ParseResult, call::CallExpr, ParserState};

#[derive(Debug, Clone)]
pub struct VariableExpr<'a> {
    pub name: LexString<'a>
}

impl<'a> VariableExpr<'a> {
    pub fn parse_raw(lexer: Lexer<'a>) -> Self {
        VariableExpr { name: lexer.take_identifier() }
    }
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<Expr> {
        let v = Self::parse_raw(lexer.clone());
        lexer.eat_wsp();
        if lexer.peek_char().render() == "(" || lexer.peek_char().render() == "<" {
            Ok(Expr::new(ExprVal::Call(CallExpr::parse_raw(lexer, v, state)?)))
        } else {
            if state.data.read().unwrap().prefix_fns.contains(&v.name.render().to_string()) {
                // is a Prefix Fn
                Ok(Expr::new(ExprVal::Call(CallExpr { target: v, inputs: vec![Expr::parse(lexer, state)?], types: None})))
            }
            // else if state.data.read().unwrap().infix_fns.contains_key(lexer.peek_identifier().render()) {
            //     // is an Infix Fn first argument
            //     Ok(Expr::new("unknown".to_string(), ExprVal::Call(CallExpr { target: VariableExpr::parse_raw(lexer.clone() /*, state.clone()*/), inputs: vec![Expr::new("unknown".to_string(), ExprVal::Variable(v)), Expr::parse(lexer, state)?]})))
            // } 
            else if state.data.read().unwrap().suffix_fns.contains(&lexer.peek_identifier().render().to_string()) {
                // is a Suffix FirstArg
                Ok(Expr::new(ExprVal::Call(CallExpr {target: VariableExpr::parse_raw(lexer.clone()), inputs: vec![Expr::new(ExprVal::Variable(v))], types: None})))
            } else {
                // infix fns are handled by binary parsing, hopefully
                Ok(Expr::new(ExprVal::Variable(v)))
            }
        }
    }
}
