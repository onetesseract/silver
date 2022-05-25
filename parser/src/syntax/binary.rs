use crate::lexer::Lexer;

use super::{variable::VariableExpr, Expr, ParseResult, ExprVal, ParserState};

#[derive(Debug, Clone)]
pub struct BinaryExpr<'a> {
    op: VariableExpr<'a>,
    lhs: Expr<'a>,
    rhs: Expr<'a>,
}

impl<'a> BinaryExpr<'a> {
    pub fn maybe_parse_raw(lexer: Lexer<'a>, state: ParserState) -> ParseResult<Expr> {
        let lhs = Expr::parse_primary(lexer.clone(), state.clone())?;
        lexer.eat_wsp();
        Self::parse_binop_rhs(lexer, lhs, -1, state)
    }
    fn parse_binop_rhs(lexer: Lexer<'a>, lhs: Expr<'a>, prec: isize, state: ParserState) -> ParseResult<'a, Expr<'a>> {
        let mut lhs = lhs;
        loop {
            // If this is a binop that binds at least as tightly as the current binop,
            // consume it, otherwise we are done.
            lexer.eat_wsp();
            let op = lexer.peek_identifier();
            let read = state.data.read().unwrap();
            let parsed_prec = read.infix_fns.get(&op.render().to_string());
            let parsed_prec = match parsed_prec {
                Some(s) => s,
                None => return Ok(lhs),
            };
            if prec > *parsed_prec || op.render() == "" {
                return Ok(lhs);
            }
            drop(read);
            // ok its a binop, eat it
            lexer.take_identifier();
            lexer.eat_wsp();
            let mut rhs = Expr::parse_primary(lexer.clone(), state.clone())?;
            lexer.eat_wsp();
            let peek_op = lexer.peek_identifier().render();
            let peek_prec = match state.clone().data.read().unwrap().infix_fns.get(&peek_op.to_string()) {
                Some(s) => *s,
                None => -1,
            };
            if prec < peek_prec {
                rhs = Self::parse_binop_rhs(lexer.clone(), rhs, prec + 1, state.clone())?;
            }
            lhs = Expr::new("unknown".to_string(), ExprVal::Binary(BinaryExpr { op: VariableExpr { name: op }, lhs, rhs }));
        }
    }
}
