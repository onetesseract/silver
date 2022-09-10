












define i64* @get({ i64, i64, i64* }* %0, i64 %1) {
entry_block:
  %5 = alloca i64*, align 8
  %4 = alloca i64, align 8
  %3 = alloca { i64, i64, i64* }*, align 8
  store { i64, i64, i64* }* %0, { i64, i64, i64* }** %3, align 8
  store i64 %1, i64* %4, align 4
  %6 = load { i64, i64, i64* }*, { i64, i64, i64* }** %3, align 8
  %7 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %6, i32 0, i32 2
  %8 = load i64*, i64** %7, align 8
  store i64* %8, i64** %5, align 8
  %9 = load i64*, i64** %5, align 8
  %10 = load i64, i64* %4, align 4
  %11 = getelementptr i64, i64* %9, i64 %10
  ret i64* %11
}

define i64* @get({ i64, i64, i64* }* %0, i64 %1) {
entry_block:
  %data = alloca i64*, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, i64* }*, align 8
  store { i64, i64, i64* }* %0, { i64, i64, i64* }** %va, align 8
  store i64 %1, i64* %index, align 4
  %va_variable_load = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load, i32 0, i32 2
  %b_variable_load = load i64*, i64** %struct_gep, align 8
  store i64* %b_variable_load, i64** %data, align 8
  %data_variable_load = load i64*, i64** %data, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr inbounds i64, i64* %data_variable_load, i64 %index_variable_load
  ret i64* %asm_gep
}
