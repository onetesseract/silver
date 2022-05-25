use std::{sync::{RwLock, Arc}, fmt};

#[derive(Debug, Clone)]
pub struct LexerInternal<'ctx> {
    input: &'ctx str,
    pub index: usize,
}

#[derive(Clone)]
pub struct LexString<'ctx> {
    lexer: Lexer<'ctx>,
    start: usize,
    end: usize,
}

impl<'ctx> LexString<'ctx> {
    pub fn render(&self) -> &'ctx str {
        self.lexer.data.read().unwrap().input.split_at(self.start).1.split_at(self.end - self.start).0
    }
}

impl<'ctx> fmt::Debug for LexString<'ctx> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.debug_struct("LexString")
            .field("lexer", &"...") // &self.lexer)
            .field("start", &self.start)
            .field("end", &self.end)
            .field("rendered-as", &self.render()) // &self.lexer.data.read().unwrap().input.split_at(self.start).1.split_at(self.end - self.start).0)
            .finish()
        // Ok(format!("LexString {\nlexer: {:?},\nstart:\n{:?},\nend:{:?},\nrendered as '{}'", self.lexer, self.start, self.end, self.lexer.data.read().unwrap().input.split_at(self.start).1.split_at(self.end - self.start).0))
    }
}

pub fn match_identifier(c: char) -> bool {
    c.is_alphabetic() | "_+-><*/=".contains(c)
}

#[derive(Debug, Clone)]
pub struct Lexer<'ctx> {
    pub data: Arc<RwLock<LexerInternal<'ctx>>>,
}

impl<'ctx> Lexer<'ctx> {
    pub fn new(s: &'ctx str) -> Self {
        Lexer {data: Arc::new(RwLock::new(LexerInternal{input:s, index: 0}))}
    }
    pub fn take_while<F>(&self, mut f: F) -> LexString<'ctx> 
    where F: FnMut(char) -> bool 
    {
        let t = self.data.clone();
        let mut this = t.write().unwrap();
        let index = this.index;
        while this.input.as_bytes().len() > this.index && f(this.input.as_bytes()[this.index] as char) {
            this.index += 1;
        }
        LexString { lexer: self.clone(), start: index, end: this.index }
    }
    pub fn peek_while<F>(&self, f: F) -> LexString<'ctx>
    where F: FnMut(char) -> bool
    {
        let index = self.data.read().unwrap().index;
        let res = self.take_while(f);
        self.data.write().unwrap().index = index;
        res
    }
    pub fn take_number(&self) -> LexString<'ctx> {
        self.take_while(| c: char | c.is_ascii_digit() || c == '.')
    }
    // TODO: make it not broken w/ number identifiers
    pub fn take_identifier(&self) -> LexString<'ctx> {
        // let mut is_first = true;
        self.take_while(match_identifier)
    }
    pub fn peek_identifier(&self) -> LexString<'ctx> {
        self.peek_while(match_identifier)
    }
    pub fn is_eof(&self) -> bool {
        let t = self.data.read().unwrap();
        t.input.as_bytes().len() <= t.index
    }
    pub fn take_char(&self) -> LexString<'ctx> {
        let s = self.peek_char();
        self.data.write().unwrap().index += 1;
        s
    }
    pub fn peek_char(&self) -> LexString<'ctx> {
        let t = self.data.clone();
        let t = t.read().unwrap();
        let ls = LexString { lexer: self.clone(), start: t.index, end: t.index + 1 };
        ls
    }
    pub fn eat_wsp(&self) -> LexString<'ctx> {
        self.take_while(| c: char | c.is_whitespace())
    }
}

