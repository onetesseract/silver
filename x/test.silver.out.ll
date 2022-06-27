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

define { i64, i64* } @test() {
entry_block:
  %a = alloca { i64, i64* }, align 8
  %struct_gep = getelementptr inbounds { i64, i64* }, { i64, i64* }* %a, i32 0, i32 0
  call void @"=.1"(i64* %struct_gep, i64 67)
  %a_variable_load = load { i64, i64* }, { i64, i64* }* %a, align 8
  ret { i64, i64* } %a_variable_load
}

define void @primt({ i64, i64* } %0) {
entry_block:
  %a = alloca { i64, i64* }, align 8
  store { i64, i64* } %0, { i64, i64* }* %a, align 8
  %struct_gep = getelementptr inbounds { i64, i64* }, { i64, i64* }* %a, i32 0, i32 0
  %struct_gep_deref = load i64, i64* %struct_gep, align 4
  call void @putchar(i64 %struct_gep_deref)
  ret void
}

define i64 @main() {
entry_block:
  %a = alloca { i64, i64* }, align 8
  %test_call = call { i64, i64* } @test()
  call void @"="({ i64, i64* }* %a, { i64, i64* } %test_call)
  %a_variable_load = load { i64, i64* }, { i64, i64* }* %a, align 8
  call void @primt({ i64, i64* } %a_variable_load)
  ret i64 0
}
