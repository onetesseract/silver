; ModuleID = 'broken_blocks.silver'
source_filename = "broken_blocks.silver"

define i1 @summat() {
entry_block:
  ret i1 true
}

define void @eep() {
entry_block:
  br i1 false, label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  br label %while_loop_cond_check_basic_block

if_cont_block:                                    ; preds = %while_loop_cont_basic_block, %if_then_block
  ret void

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %if_else_block
  br i1 true, label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 214, end: 220, rendered-as: \22summat\22 } })_call" = call i1 @summat()
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  br label %if_cont_block
}
