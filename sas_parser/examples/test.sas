#      index bitwidth value
# @const 0     8        63

#       index bitwidth  name
@extern 0     64        exit 
# this is a function ptr

#       export_name internal_index bitwidth
# @export main        0              64

# all frame, function const indexes are GLOBAL
# so we can just assimilate all frame*s into a big [] and index it nicely
# might disable/flag-enable that because memoryyyy

# main(u8 u8) u8
~function 1
  # this is not a brilliant example but it works
  #       index bitwidth
  @return 2     8
  @arg    3     8
  @arg    4     8
  ~frame 5
    @var  6     16
    # operation output index1 index2 (opt) index3
    add_u8    2      3      4
    # special operation due to variable arguments
    #    function arg1 arg2 etc etc etc
    call 0        2

    

