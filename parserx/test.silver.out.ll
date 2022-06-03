; ModuleID = './test.silver'
source_filename = "./test.silver"

declare void @putchar(i8)

define void @main(i8 %0, i8 %1) {
entry_block:
  %argv = alloca i8, align 1
  %argc = alloca i8, align 1
  store i8 %0, i8* %argc, align 1
  store i8 %1, i8* %argv, align 1
  %argc_variable_load = load i8, i8* %argc, align 1
  call void @putchar(i8 %argc_variable_load)
  ret void
}
