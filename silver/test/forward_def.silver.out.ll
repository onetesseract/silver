; ModuleID = 'forward_def.silver'
source_filename = "forward_def.silver"

@global_str = private unnamed_addr constant [3 x i8] c"a\0A\00", align 1
@global_str.3 = private unnamed_addr constant [3 x i8] c"b\0A\00", align 1

declare void @printf(i8*)

define void @a() {
entry_block:
  call void @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str, i32 0, i32 0))
  call void @b()
  ret void
}

define void @b() {
entry_block:
  call void @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.3, i32 0, i32 0))
  call void @a()
  ret void
}

declare void @a.1()

declare void @b.2()

define void @main() {
entry_block:
  call void @a()
  ret void
}
