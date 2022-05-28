use std::{collections::HashMap, sync::{Arc, RwLock}};

use crate::lexer::Lexer;

use self::{number::NumberExpr, variable::VariableExpr, call::CallExpr, binary::BinaryExpr, block::Block, vardef::VarDef, proto::FnProto};

pub mod number;
pub mod ty;
pub mod variable;
pub mod binary;
pub mod call;
pub mod block;
pub mod proto;
pub mod vardef;

pub type ParseResult<'a, T> = Result<T, ParseError<'a>>;

#[derive(Debug, Clone)]
pub enum ExprVal<'a> {
    Number(NumberExpr<'a>),
    Variable(VariableExpr<'a>),
    Call(CallExpr<'a>),
    Binary(BinaryExpr<'a>),
    Block(Block<'a>),
    VarDef(VarDef<'a>),
}

#[derive(Debug, Clone)]
pub struct ParseError<'a> {
    lexer: Lexer<'a>,
    offset: usize,
    message: String,
}

impl<'a> ParseError<'a> {
    pub fn new(lexer: Lexer<'a>, message: String) -> Self {
        panic!("{}: {}", lexer.data.read().unwrap().index, message);
        ParseError { lexer: lexer.clone(), message, offset: lexer.data.read().unwrap().index }
    }
}

#[derive(Debug, Clone)]
pub struct Expr<'a> {
    ty: ty::Ty,
    val: Box<ExprVal<'a>>,
}

impl<'a> Expr<'a> {
    pub fn new(s: String, val: ExprVal<'a>) -> Self {
        Expr {ty: ty::Ty { ty: s }, val: Box::new(val) }
    }
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<Self> {
        lexer.eat_wsp();
        binary::BinaryExpr::maybe_parse_raw(lexer, state)
    }
    pub fn parse_primary(lexer: Lexer<'a>, state: ParserState) -> ParseResult<Self> {
        lexer.eat_wsp();
        match lexer.peek_char().render().as_bytes()[0] as char {
            '(' => Self::parse_paren(lexer, state),
            '0'..='9' => NumberExpr::parse(lexer),
            'A'..='Z' | 'a'..='z' | '_' => VarDef::maybe_parse_raw(lexer.clone(), VariableExpr::parse(lexer, state.clone())?, state),
            '{' => Block::parse(lexer, state),
            x => Err(ParseError::new(lexer, format!("Don't know how to parse '{}'", x)))
        }
    }
    pub fn parse_paren(lexer: Lexer<'a>, state: ParserState) -> ParseResult<Self> {
        let c = lexer.take_char().render();
        if c != "(" {
            return Err(ParseError::new(lexer, format!("Expected (, found {}", c)));
        }
        let val = Self::parse(lexer.clone(), state)?;
        lexer.eat_wsp();
        let c = lexer.take_char().render();
        if c != ")" {
            return Err(ParseError::new(lexer, format!("Expected ), found {}", c)));
        }
        Ok(val)
    }
}

pub struct ParserStateInternal {
    pub infix_fns: HashMap<String, isize>,
    pub suffix_fns: Vec<String>,
}

impl ParserStateInternal {
    pub fn new() -> Self {
        let mut infix_fns = HashMap::new();
        infix_fns.insert("*".to_string(), 100);
        infix_fns.insert("/".to_string(), 100);
        infix_fns.insert("+".to_string(), 75);
        infix_fns.insert("-".to_string(), 75);
        infix_fns.insert("<".to_string(), 50);
        infix_fns.insert(">".to_string(), 50);
        infix_fns.insert("==".to_string(), 40);
        infix_fns.insert("=".to_string(), 25);
        ParserStateInternal { infix_fns, suffix_fns: vec![] }
    }
}

#[derive(Clone)]
pub struct ParserState {
    pub data: Arc<RwLock<ParserStateInternal>>,
}
impl ParserState {
    pub fn new() -> Self {
        ParserState { data: Arc::new(RwLock::new(ParserStateInternal::new()))}
    }
}

#[derive(Debug, Clone)]
pub enum TlExpr<'a> {
    Extern(FnProto<'a>),
    Func(FnProto<'a>, Expr<'a>),
}

pub fn parse_tl_expr<'a>(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, TlExpr> {
    lexer.eat_wsp();
    let proto = FnProto::parse(lexer.clone(), state.clone())?;
    lexer.eat_wsp();
    match lexer.peek_char().render() {
        ";" => {lexer.take_char(); return Ok(TlExpr::Extern(proto))},
        "=" => (),
        x => return Err(ParseError::new(lexer, format!("Expected = or ;, found `{}`", x))),
    }
    lexer.take_char();
    lexer.eat_wsp();
    let body = Expr::parse(lexer.clone(), state)?;
    lexer.eat_wsp();

    let t = match lexer.peek_char().render() {
        ";" => Ok(TlExpr::Func(proto, body)),
        x => return Err(ParseError::new(lexer, format!("Expected ;, found {}", x))),
    };
    lexer.take_char();
    return t;

}

mod tests {
    #[test]
    fn parsing_prim() {
        let l = crate::lexer::Lexer::new("f(x int) : int = 2 * x;");
        // println!("{:#?}", super::parse_tl_expr(l, super::ParserState::new()));
    }
}
