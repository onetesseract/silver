use std::{collections::HashMap, sync::{Arc, RwLock}};

use crate::lexer::{Lexer, match_spec_id, LexString};

use self::{number::NumberExpr, variable::VariableExpr, call::CallExpr, block::Block, vardef::VarDef, proto::{FnProto, FnType}, hints::Hints, cdef::CDef, string::StringExpr, template::Template, keywords::Boolean, while_loop::WhileLoop, if_expr::IfExpr, ret::ReturnExpr, cast::Cast, ty::Ty};

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
pub mod template;
pub mod keywords;
pub mod while_loop;
pub mod if_expr;
pub mod ret;
pub mod cast;

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
    Boolean(Boolean<'a>),
    WhileLoop(WhileLoop<'a>),
    IfExpr(IfExpr<'a>),
    ReturnExpr(ReturnExpr<'a>),
    Cast(Cast<'a>),
}

#[derive(Debug, Clone)]
pub struct ParseError<'a> {
    lexer: Lexer<'a>,
    offset: usize,
    message: String,
}

impl<'a> ParseError<'a> {
    pub fn new(lexer: Lexer<'a>, message: String) -> Self {
        let index = lexer.data.read().unwrap().index;
        let read = lexer.data.read().unwrap();
        let (a_split, b_split) = read.input.split_at(index);
        println!("{}<--\n{}", a_split, b_split);
        panic!("{}: {}", index, message);
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
        let target = match lexer.peek_char().render().as_bytes()[0] as char {
            '(' => Self::parse_paren(lexer.clone(), state.clone()),
            '0'..='9' => NumberExpr::parse(lexer.clone()),
            'A'..='Z' | 'a'..='z' | '_' => VariableExpr::parse(lexer.clone(), state.clone()),
            '{' => Block::parse(lexer.clone(), state.clone()),
            '@' => CDef::parse(lexer.clone(), state.clone()),
            '\"' => StringExpr::parse(lexer.clone(), state.clone()),
            x => {
                if match_spec_id(x) {
                    VariableExpr::parse(lexer.clone(), state.clone())
                } else {
                    Err(ParseError::new(lexer.clone(), format!("Don't know how to parse '{}'", x)))
                }
            },
        };
        VarDef::maybe_parse_raw(lexer.clone(), Cast::maybe_parse(target?, lexer, state.clone())?, state)
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
        infix_fns.insert(".".to_string(), 200);
        infix_fns.insert("*".to_string(), 100);
        infix_fns.insert("/".to_string(), 100);
        infix_fns.insert("+".to_string(), 75);
        infix_fns.insert("-".to_string(), 75);
        infix_fns.insert("<".to_string(), 50);
        infix_fns.insert(">".to_string(), 50);
        infix_fns.insert("==".to_string(), 40);
        infix_fns.insert("=".to_string(), 25);
        infix_fns.insert("as".to_string(), 5);
        ParserStateInternal { infix_fns, suffix_fns: vec![], prefix_fns: vec!["&".to_string(), "*".to_string()], upon_fns: vec![] }
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
pub struct TlExpr<'a> {
    pub hints: Option<Hints<'a>>,
    pub template: Option<Template<'a>>,
    pub proto: Option<FnProto<'a>>,
    pub body: Option<Expr<'a>>,
    pub typedef: Option<(LexString<'a>, Ty<'a>)>,
    pub cdef: Option<CDef<'a>>,
}

fn take_comment<'a>(lexer: Lexer<'a>) -> bool {
    lexer.eat_wsp();
    let x = lexer.peek_char().render();
    if x == "/" {
        let lexer_ = lexer.clone();
        lexer_.take_char();
        if lexer_.peek_char().render() == "/" {
            lexer.take_char();
            lexer.take_char();
            while lexer.take_char().render() != "\n" && !lexer.is_eof() {}
            return true;
        }
        if lexer_.peek_char().render() == "*" {
            lexer.take_char();
            lexer.take_char();
            let mut was_asterix_last = false;
            while !lexer.is_eof() {
                let t = lexer.take_char().render();
                if t == "*" {
                    was_asterix_last = true;
                } else if t == "/" && was_asterix_last {
                    break;
                } else {
                    was_asterix_last = false;
                }
            }
            return true;
        }
    }
    return false;
}

pub fn parse_tl_expr<'a>(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, TlExpr> {
    lexer.eat_wsp();

    if lexer.peek_char().render() == "@" {
        let cdef = Some(CDef::parse_raw(lexer.clone(), state)?);

        match lexer.peek_char().render().as_str() {
            ";" => {},
            x => return Err(ParseError::new(lexer, format!("Expected ;, found `{}`", x))),
        }
        lexer.take_char();

        return Ok(TlExpr { hints: None, template: None, proto: None, body: None, typedef: None, cdef});
    }

    let hints = match lexer.peek_char().render().as_str() {
        "#" => Some(Hints::parse(lexer.clone())?),
        _ => None,
    };

    lexer.eat_wsp();

    let template = match lexer.peek_char().render().as_str() {
        "<" => Some(Template::parse(lexer.clone(), state.clone())?),
        _ => None,
    };

    lexer.eat_wsp();

    println!("p: {}", lexer.peek_identifier().render());

    if lexer.peek_identifier().render() == "type" {
        lexer.take_identifier();
        lexer.eat_wsp();
        let name = lexer.take_identifier();
        lexer.eat_wsp();
        if lexer.peek_char().render() != "=" {
            return Err(ParseError::new(lexer, "Expected = for typedef".to_string()))
        }
        lexer.take_char();
        lexer.eat_wsp();
        let ty = Ty::parse(lexer.clone(), state)?;

        match lexer.peek_char().render().as_str() {
            ";" => {},
            x => return Err(ParseError::new(lexer, format!("Expected ;, found `{}`", x))),
        }
        lexer.take_char();

        return Ok(TlExpr {proto: None, body: None, template, typedef: Some((name, ty)), hints, cdef: None})
    }

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
    match lexer.peek_char().render().as_str() {
        ";" => {lexer.take_char(); return Ok(TlExpr { hints, template, proto: Some(proto), body: None, typedef: None, cdef: None })},
        "=" => (),
        x => return Err(ParseError::new(lexer, format!("Expected = or ;, found `{}`", x))),
    }
    lexer.take_char();
    lexer.eat_wsp();
    let body = Expr::parse(lexer.clone(), state)?;
    lexer.eat_wsp();

    let t = match lexer.peek_char().render().as_str() {
        ";" => Ok(TlExpr { hints, template, proto: Some(proto), body: Some(body) /* that I used to know */, typedef: None, cdef: None }),
        x => return Err(ParseError::new(lexer, format!("Expected ;, found `{}`", x))),
    };
    lexer.take_char();
    return t;

}
//
// mod tests {
//     #[test]
//     fn parsing_prim() {
//         let l = crate::lexer::Lexer::new("f(x int) : int = 2 * x;");
//         println!("{:#?}", super::parse_tl_expr(l, super::ParserState::new()));
//     }
// }
