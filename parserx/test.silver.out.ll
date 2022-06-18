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

define double @"+.1"(double %0, double %1) {
entry_block:
  %b = alloca double, align 8
  %a = alloca double, align 8
  store double %0, double* %a, align 8
  store double %1, double* %b, align 8
  %a_variable_load = load double, double* %a, align 8
  %b_variable_load = load double, double* %b, align 8
  %asm_float_add = fadd double %a_variable_load, %b_variable_load
  ret double %asm_float_add
}

define i64 @"/"(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_div = sdiv i64 %a_variable_load, %b_variable_load
  ret i64 %asm_int_div
}

define double @"/.2"(double %0, double %1) {
entry_block:
  %b = alloca double, align 8
  %a = alloca double, align 8
  store double %0, double* %a, align 8
  store double %1, double* %b, align 8
  %a_variable_load = load double, double* %a, align 8
  %b_variable_load = load double, double* %b, align 8
  %asm_float_div = fdiv double %a_variable_load, %b_variable_load
  ret double %asm_float_div
}

define double @"%"(double %0) {
entry_block:
  %a = alloca double, align 8
  store double %0, double* %a, align 8
  %a_variable_load = load double, double* %a, align 8
  %"/_call" = call double @"/.2"(double %a_variable_load, double 1.000000e+02)
  ret double %"/_call"
}

define i64 @something(i64 %0) {
entry_block:
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  ret i64 7
}

define i64 @something.3(double %0) {
entry_block:
  %a = alloca double, align 8
  store double %0, double* %a, align 8
  ret i64 6
}

define i64 @main(i64 %0, i64 %1) {
entry_block:
  %argv = alloca i64, align 8
  %argc = alloca i64, align 8
  store i64 %0, i64* %argc, align 4
  store i64 %1, i64* %argv, align 4
  %templatable_call = call i64 @templatable(double 2.300000e+00)
  ret i64 %templatable_call
}

define i64 @templatable(double %0) {
entry_block:
  %a = alloca double, align 8
  store double %0, double* %a, align 8
  %a_variable_load = load double, double* %a, align 8
  %something_call = call i64 @something.3(double %a_variable_load)
  ret i64 %something_call
}
