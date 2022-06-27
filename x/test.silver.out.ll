; ModuleID = './test.silver'
source_filename = "./test.silver"

declare void @putchar(i64)

define void @"="(i64* %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64*, align 8
  store i64* %0, i64** %a, align 8
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64*, i64** %a, align 8
  %b_variable_load = load i64, i64* %b, align 4
  store i64 %b_variable_load, i64* %a_variable_load, align 4
  ret void
}

define i64 @-(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_sub = sub i64 %a_variable_load, %b_variable_load
  ret i64 %asm_int_sub
}

define i64 @"+"(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_add = add i64 %a_variable_load, %b_variable_load
  ret i64 %asm_int_add
}

define i1 @"!="(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_cmp_eq = icmp ne i64 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_eq
}

define i64 @main() {
entry_block:
  %count = alloca i64, align 8
  call void @"="(i64* %count, i64 65)
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %entry_block
  %count_variable_load = load i64, i64* %count, align 4
  %"+_call" = call i64 @"+"(i64 65, i64 26)
  %"!=_call" = call i1 @"!="(i64 %count_variable_load, i64 %"+_call")
  br i1 %"!=_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %count_variable_load1 = load i64, i64* %count, align 4
  call void @putchar(i64 %count_variable_load1)
  %count_variable_load2 = load i64, i64* %count, align 4
  %"+_call3" = call i64 @"+"(i64 %count_variable_load2, i64 1)
  call void @"="(i64* %count, i64 %"+_call3")
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  ret i64 0
}
