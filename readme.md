# Silver  
#### silver is certainly a Language of all time (no guarantees)  
This project is legacy, and I am working on a better + more elegant replacement. However, it has still taught me a good number of things.  
It made it a VERY respectable distance towards being fully selfhosted, and the selfhosted version can correctly compile a number of programs (I cannot remember if it can compile itself, nor how to check).

---

#### Todo List:
- [X] Structs
- [X] Struct access syntax (`x.y` with `y` a variable)
- [X] Typedefs - i still wanna rethink them maybe
- [X] Pointers and referencing/dereferencing
- [X] Bitcasting
- [X] Struct function access syntax
- [X] If statements
- [ ] Loops!
  - [X] While loops - Done but untested - ~~update: they break everything~~ no it was me
  - [X] Break statements, done but not "safe" because multiple terminators
- [X] Return statements - done, untested
- [X] Semicolons - done, ~~untested~~
- [X] Comments
- [X] Including other files
- [X] string literals
- [X] literally assigning
- [X] enums
- [ ] macros of sorts
- [ ] moving casting to macros
- [X] templated structs
- [?] proper cacheing of templated fns
- [X] Array indexing syntax

### Fixes todo:
 - [ ] Prefix templated calls :( (and does selfhosted work w them??)

### Selfhosted Todo List:
#### Parsing:
- [X] binary ops
- [X] blocks
- [X] brackets (incl calls somehow)
- [X] casts
- [X] cdefs (pretty much done with brackets, just compiled differently)
- [X] if
- [X] prefix, suffix, and template calls
- [X] template typeexprs
- [X] numbers
- [X] return
- [X] strings
- [X] vardefs
- [X] identifiers/variables
- [X] Types
    - [X] struct types
- [X] while
- [ ] continue
###### top level:
- [X] enums
- [X] hints
- [X] protos
- [X] templates
- [X] macros (oh no)
- [ ] Cdefs
##### low priority:
- [ ] bracket typedefs
- [ ] watch keywords

#### Compiling
##### Expr reprs
- [X] Number
- [X] Identifier
- [X] Block
- [X] String
- [X] If
- [X] While
- [X] Vardef
- [X] Return
- [X] Cast
- [ ] CDef
- [X] Calls
    - [X] Prefix
    - [X] Suffix
    - [X] Infix
    - [X] Postfix brackets
- [X] Templates
- [X] Char
#### Types
- [ ] types
#### Other  
- [ ] using LexStrings instead of &u8s for compiling + instructions
