; ModuleID = './test.silver'
source_filename = "./test.silver"

define i1 @"=="(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %tmp_load = load i64, i64* %a, align 4
  %tmp_load1 = load i64, i64* %b, align 4
  %asm_int_cmp_eq = icmp eq i64 %tmp_load, %tmp_load1
  ret i1 %asm_int_cmp_eq
}

define i64 @main(i64 %0, i8** %1) {
entry_block:
  %argv = alloca i8**, align 8
  %argc = alloca i64, align 8
  store i64 %0, i64* %argc, align 4
  store i8** %1, i8*** %argv, align 8
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %if_cont_block, %entry_block
  br i1 true, label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %deref_load = load i64, i64* %argc, align 4
  %"==_call" = call i1 @"=="(i64 %deref_load, i64 1)
  br i1 %"==_call", label %if_then_block, label %if_cont_block

while_loop_cont_basic_block:                      ; preds = %if_then_block, %while_loop_cond_check_basic_block
  ret i64 0

if_then_block:                                    ; preds = %while_loop_body_basic_block
  br label %while_loop_cont_basic_block
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %while_loop_body_basic_block
  br label %while_loop_cond_check_basic_block
}
