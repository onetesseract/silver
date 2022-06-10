; ModuleID = './test.silver'
source_filename = "./test.silver"

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

define i64 @main(i64 %0, i64 %1) {
entry_block:
  %argv = alloca i64, align 8
  %argc = alloca i64, align 8
  store i64 %0, i64* %argc, align 4
  store i64 %1, i64* %argv, align 4
  %"+_call" = call i64 @"+"(i64 7, i64 4)
  ret i64 %"+_call"
}
