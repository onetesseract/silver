use std::{collections::HashMap, sync::{Arc, RwLock}};

use crate::lexer::Lexer;

use self::{number::NumberExpr, variable::VariableExpr, call::CallExpr, block::Block, vardef::VarDef, proto::{FnProto, FnType}, hints::Hints, cdef::CDef, string::StringExpr};

pub mod number;
pub mod ty;
pub mod variable;
pub mod binary;
pub mod call;
pub mod block;
pub mod proto;
pub mod vardef;
pub mod hints;
pub mod cdef;
pub mod string;

pub type ParseResult<'a, T> = Result<T, ParseError<'a>>;

#[derive(Debug, Clone)]
pub enum ExprVal<'a> {
    Number(NumberExpr<'a>),
    Variable(VariableExpr<'a>),
    Call(CallExpr<'a>),
    // Binary(BinaryExpr<'a>),
    Block(Block<'a>),
    VarDef(VarDef<'a>),
    CDef(CDef<'a>),
    String(StringExpr<'a>),
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
    pub val: Box<ExprVal<'a>>,
}

impl<'a> Expr<'a> {
    pub fn new(val: ExprVal<'a>) -> Self {
        Expr {val: Box::new(val) }
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
            '#' => CDef::parse(lexer, state),
            '\"' => StringExpr::parse(lexer, state),
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
    pub prefix_fns: Vec<String>,
    pub upon_fns: Vec<String>,
}

// TODO: better fn thype thingies

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
        ParserStateInternal { infix_fns, suffix_fns: vec![], prefix_fns: vec![], upon_fns: vec![] }
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
    Extern(Option<Hints<'a>>, FnProto<'a>),
    Func(Option<Hints<'a>>, FnProto<'a>, Expr<'a>),
}

pub fn parse_tl_expr<'a>(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, TlExpr> {
    lexer.eat_wsp();

    let hints = match lexer.peek_char().render() {
        "#" => Some(Hints::parse(lexer.clone())?),
        _ => None,
    };

    lexer.eat_wsp();
    let proto = FnProto::parse(lexer.clone(), state.clone())?;
    let s = state.clone();
    let mut write = s.data.write().unwrap();

    match proto.class {
        FnType::Upon => write.upon_fns.push(proto.name.render().to_string()),
        FnType::Prefix => write.prefix_fns.push(proto.name.render().to_string()),
        FnType::Suffix => write.suffix_fns.push(proto.name.render().to_string()),
        FnType::Infix => {
            if let Some(hints) = &hints {
                if let Some(hint) = hints.hints.get("prec") {
                    if hint.len() != 0 {
                        if let Ok(val) = hint[0].render().parse::<isize>() {
                            write.infix_fns.insert(proto.name.render().to_string(), val);
                        } else {
                            return Err(ParseError::new(lexer, format!("Expected valid integer, got {}", hint[0].render())))
                        }
                    } else {
                        return Err(ParseError::new(lexer, "Require a number with a prec hint".to_string()))
                    }
                } else {
                    return Err(ParseError::new(lexer, "Require a prec hint for infix functions".to_string()))
                }
            } else {
                return Err(ParseError::new(lexer, "Require a prec hint for infix functions".to_string()))
            }
        },
    };
    drop(write);
    lexer.eat_wsp();
    match lexer.peek_char().render() {
        ";" => {lexer.take_char(); return Ok(TlExpr::Extern(hints, proto))},
        "=" => (),
        x => return Err(ParseError::new(lexer, format!("Expected = or ;, found `{}`", x))),
    }
    lexer.take_char();
    lexer.eat_wsp();
    let body = Expr::parse(lexer.clone(), state)?;
    lexer.eat_wsp();

    let t = match lexer.peek_char().render() {
        ";" => Ok(TlExpr::Func(hints, proto, body)),
        x => return Err(ParseError::new(lexer, format!("Expected ;, found `{}`", x))),
    };
    lexer.take_char();
    return t;

}

mod tests {
    #[test]
    fn parsing_prim() {
        let l = crate::lexer::Lexer::new("f(x int) : int = 2 * x;");
        println!("{:#?}", super::parse_tl_expr(l, super::ParserState::new()));
    }
}
