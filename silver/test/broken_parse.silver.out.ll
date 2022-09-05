; ModuleID = 'broken_parse.silver'
source_filename = "broken_parse.silver"

define void @y() {
entry_block:
  %va = alloca {}, align 8
  ret void
}
