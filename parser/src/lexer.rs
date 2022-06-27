use std::{sync::{RwLock, Arc}, fmt, hash::Hash};

#[derive(Debug, Clone)]
pub struct LexerInternal<'ctx> {
    pub input: &'ctx str,
    pub index: usize,
}

// TODO: proper Eqs
#[derive(Clone)]
pub struct LexString<'ctx> {
    lexer: Lexer<'ctx>,
    start: usize,
    end: usize,
}

impl<'ctx> PartialEq for LexString<'ctx> {
    fn eq(&self, other: &Self) -> bool {
        self.render() == other.render()
    }
}

impl<'ctx> Eq for LexString<'ctx> {

}

impl<'ctx> LexString<'ctx> {
    pub fn render(&self) -> &'ctx str {
        // i sorry
        if self.start >= self.lexer.data.read().unwrap().input.len() {
            return ""
        } else {
            return self.lexer.data.read().unwrap().input
            .split_at(self.start).1
            .split_at(self.end - self.start).0

        }
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


impl<'ctx> Hash for LexString<'ctx> {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.render().hash(state)    
    }
}

pub fn match_identifier(c: char) -> bool {
    c.is_alphabetic() || c == '_'
}
pub fn match_spec_id(c: char) -> bool {
    "+-><*/=%!&.".contains(c)
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
        if self.is_eof() {
            let index = self.data.read().unwrap().index;
            return LexString { lexer: self.clone(), start: index, end: index };
        }
        let mut first = true;
        let begin = self.data.read().unwrap().index;
        while self.peek_char().render().as_bytes()[0].is_ascii_alphanumeric() || self.peek_char().render().as_bytes()[0] as char == '_' {
            if first {
                if "0123456789".contains(self.peek_char().render().as_bytes()[0] as char) {
                    break;
                }
                first = false;
            }
            self.take_char();
        }
        let r = LexString { lexer: self.clone(), start:begin, end: self.data.read().unwrap().index };

        // return res;
        // // let mut is_first = true;
        // let r = self.take_while(match_identifier);
        if r.render() == "" {
            return self.take_while(match_spec_id)
        } else { return r }
    }
    pub fn peek_identifier(&self) -> LexString<'ctx> {
        let begin = self.data.read().unwrap().index;
        
        let r = self.take_identifier();

        self.data.write().unwrap().index = begin;

        // return res;
        //     
        // let r = self.peek_while(match_identifier);
        if r.render() == "" {
            return self.peek_while(match_spec_id)
        } else { return r }
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

