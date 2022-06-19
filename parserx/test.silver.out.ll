; ModuleID = './test.silver'
source_filename = "./test.silver"

define i1 @"=="(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_cmp_eq = icmp eq i64 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_eq
}

define i64 @main(i64 %0, i64 %1) {
entry_block:
  %argv = alloca i64, align 8
  %argc = alloca i64, align 8
  store i64 %0, i64* %argc, align 4
  store i64 %1, i64* %argv, align 4
  %argc_variable_load = load i64, i64* %argc, align 4
  %"==_call" = call i1 @"=="(i64 %argc_variable_load, i64 3)
  br i1 %"==_call", label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_else_block, %if_then_block
  %if_phi = phi i64 [ 0, %if_then_block ], [ 1, %if_else_block ]
  ret i64 %if_phi
}
