; ModuleID = 'file_kek'
source_filename = "file_kek"

declare i64 @printc(i64)

define i64 @test() {
entry:
  %tmp_call = call i64 @printc(i64 66)
  ret i64 %tmp_call
}
