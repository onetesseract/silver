use crate::lexer::Lexer;

use super::{Expr, ty::Ty, ParserState, ParseResult, ExprVal};

#[derive(Debug, Clone)]
pub struct Cast<'a> {
    pub target: Expr<'a>,
    pub ty: Ty<'a>,
}

impl<'a> Cast<'a> {
    pub fn maybe_parse(target: Expr<'a>, lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Expr<'a>> {
        lexer.eat_wsp();
        if lexer.peek_identifier().render().as_str() == "as" {
            println!("HERE");
            lexer.take_identifier();
            lexer.eat_wsp();
            let ty = Ty::parse(lexer, state)?;
            Ok(Expr { val: Box::new(ExprVal::Cast(Cast { target, ty }))})
        } else {
            Ok(target)
        }
    }
}
