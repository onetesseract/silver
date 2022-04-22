; ModuleID = 'file_kek'
source_filename = "file_kek"

@const_str_storage = hidden constant [2 x i8] c"\0A\00"
@const_str_storage.1 = hidden constant [12 x i8] c"end of args\00"

declare void @printf(i8*)

define void @print_argc_recursive(i64 %count, i64 %index, i8** %argv) {
entry:
  %tmp_pointer_gep = getelementptr i8*, i8** %argv, i64 %index
  %tmp_gep_load = load i8*, i8** %tmp_pointer_gep, align 8
  call void @printf(i8* noundef nonnull dereferenceable(1) %tmp_gep_load)
  %tmp_int_eq_cmp = icmp eq i64 %index, %count
  br i1 %tmp_int_eq_cmp, label %if_bb, label %else_bb

if_bb:                                            ; preds = %entry
  call void @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @const_str_storage.1, i64 0, i64 0))
  br label %ifcond_bb

ifcond_bb:                                        ; preds = %if_bb, %else_bb
  ret void

else_bb:                                          ; preds = %entry
  %putchar = call i32 @putchar(i32 10)
  %tmp_int_add = add i64 %index, 1
  call void @print_argc_recursive(i64 %count, i64 %tmp_int_add, i8** %argv)
  br label %ifcond_bb
}

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) #0

define i64 @main(i64 %argc, i8** %argv) {
entry:
  call void @print_argc_recursive(i64 %argc, i64 0, i8** %argv)
  ret i64 0
}

attributes #0 = { nofree nounwind }
