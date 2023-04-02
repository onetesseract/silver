; ModuleID = 'test.silver'
source_filename = "test.silver"

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

declare void @printf(i8*)

define void @aaaa({ i8* }* %0) {
entry_block:
  %wra = alloca { i8* }*, align 8
  store { i8* }* %0, { i8* }** %wra, align 8
  %wra_variable_load = load { i8* }*, { i8* }** %wra, align 8
  %struct_gep = getelementptr inbounds { i8* }, { i8* }* %wra_variable_load, i32 0, i32 0
  %struct_gep_deref = load i8*, i8** %struct_gep, align 8
  call void @printf(i8* %struct_gep_deref)
  ret void
}

declare void @putchar(i64)

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

define i64 @main() {
entry_block:
  %macro_arg_space2 = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 70, i64* %macro_arg_space, align 4
  %y_variable_load = load i64, i64* %macro_arg_space, align 4
  store i64 %y_variable_load, i64* %a, align 4
  %a_variable_load = load i64, i64* %a, align 4
  call void @putchar(i64 %a_variable_load)
  %a_variable_load1 = load i64, i64* %a, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 620, end: 621, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load1, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 620, end: 621, rendered-as: \22+\22 } })_call", i64* %macro_arg_space2, align 4
  %y_variable_load3 = load i64, i64* %macro_arg_space2, align 4
  store i64 %y_variable_load3, i64* %a, align 4
  %a_variable_load4 = load i64, i64* %a, align 4
  %a_variable_load5 = load i64, i64* %a, align 4
  call void @putchar(i64 %a_variable_load5)
  ret i64 0
}
