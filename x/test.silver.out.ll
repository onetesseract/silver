; ModuleID = './test.silver'
source_filename = "./test.silver"

declare void @putchar(i64)

define void @"="({ i64, i64* }* %0, { i64, i64* } %1) {
entry_block:
  %b = alloca { i64, i64* }, align 8
  %a = alloca { i64, i64* }*, align 8
  store { i64, i64* }* %0, { i64, i64* }** %a, align 8
  store { i64, i64* } %1, { i64, i64* }* %b, align 8
  %a_variable_load = load { i64, i64* }*, { i64, i64* }** %a, align 8
  %b_variable_load = load { i64, i64* }, { i64, i64* }* %b, align 8
  store { i64, i64* } %b_variable_load, { i64, i64* }* %a_variable_load, align 8
  ret void
}

define void @"=.1"(i64* %0, i64 %1) {
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

define void @print(i8* %0) {
entry_block:
  %char = alloca i8*, align 8
  store i8* %0, i8** %char, align 8
  %char_variable_load = load i8*, i8** %char, align 8
  %bitcast = bitcast i8* %char_variable_load to i64*
  %deref_load = load i64, i64* %bitcast, align 4
  call void @putchar(i64 %deref_load)
  ret void
}

define i64 @main() {
entry_block:
  %a = alloca i64, align 8
  call void @"=.1"(i64* %a, i64 75)
  %bitcast = bitcast i64* %a to i8*
  call void @print(i8* %bitcast)
  ret i64 0
}
