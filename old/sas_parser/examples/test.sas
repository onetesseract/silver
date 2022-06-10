#        name     bitwidth value
# @const sixty3     8        63

#       name bitwidth  external-name
@extern exit     64        exit 
# this is a function ptr

#       export_name internal_name bitwidth
# @export main       main           64

# all frame, function const indexes are GLOBAL
# so we can just assimilate all frame*s into a big [] and index it nicely
# might disable/flag-enable that because memoryyyy

# main(u8 u8) u8
~function main
  # this is not a brilliant example but it works
  #       index bitwidth
  @return ret     8
  @arg    ag1     8
  @arg    ag2     8
  # frames do not _need_ to be named
  ~frame f5
    @var  v     16
    # operation output index1 index2 (opt) index3
    add_u8       v      ag1    ag2
    # special operation due to variable arguments
    #    function arg1 arg2 etc etc etc
    call exit      v

    

