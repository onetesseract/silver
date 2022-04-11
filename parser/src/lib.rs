pub mod parser;
pub(crate) mod parsestring;
pub mod syntax;
pub(crate) mod delim;

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }
}
