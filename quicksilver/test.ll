; ModuleID = 'file_kek'
source_filename = "file_kek"

@const_str_storage = hidden constant [6 x i8] c"hello\00"
@const_str_storage.1 = hidden constant [5 x i8] c"whoa\00"

declare i64 @printf(i8*)

define i8 @main() {
entry:
  %tmp_call = call i64 @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([6 x i8], [6 x i8]* @const_str_storage, i64 0, i64 0))
  %tmp_call1 = call i64 @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @const_str_storage.1, i64 0, i64 0))
  ret i8 0
}
