" Vim syntax file
" Language:        Silver (name TBC)
" Maintainer:        tesscat <dont@me>
" Last Change:        2023 May 29


syntax case match

if exists("b:current_syntax")
  finish
endif

syn keyword	silverStatement	break return continue
syn keyword	silverConditional	if else
syn keyword	silverRepeat		while
syn keyword silverType      u8 u64 u32 bool
syn keyword silverFNDef     func infix prefix suffix macro
syn keyword silverTypedef   type
syn keyword silverBool      true false


syntax keyword silverTodo TODO contained

syn region silverComment start="//" end="$" keepend fold extend contains=silverTodo
syn region silverMLComment start="/\*" end="\*/" keepend fold extend contains=silverTodo
" syn match silverComment /\/\/.*/ contains=silverTodo
" syn match silverMLComment /(\/\*)[\S\s]+?(\*\/)/ contains=silverTodo

syn match silverHint /#[\d\w]+/
syn match silverCDef /@[\d\w]+/

syn match silverNumber /\d*?\.?\d*/

syn region silverString start="\"" skip="\\\"" end="\""
syn region silverChar start="'" skip="\\'" end="'"

" syntax region silverTemplate start=" <" end=">" contains=ALL

syn keyword silverPDef &
" syntax region silverVDef start=/\:/ end=/[\=\;]/ contains=ALL

syn match silverRegIdentifier /[a-zA-Z_][\w]*/
syn match silverSpecIdentifier /[\+\-\>\<\*\/\=\%\!\&\.\|\[\]\^]+/


hi link silverStatement Statement
hi link silverConditional Conditional
hi link silverRepeat Repeat
hi link silverType Type
hi link silverFNDef Typedef
hi link silverTypdef Typedef
hi link silverBool Boolean

hi link silverTodo Todo

hi link silverRegIdentifier Identifier
hi link silverSpecIdentifier Function

"hi link silverComment Comment
"hi link silverMLComment Comment

hi link silverHint Include
hi link silverCDef Define

hi link silverNumber Number

hi link silverString String
hi link silverChar Character

hi link silverTemplate Structure

hi link silverPDef SpecialChar
" hi link silverVDef SpecialChar


let b:current_syntax = "c"

