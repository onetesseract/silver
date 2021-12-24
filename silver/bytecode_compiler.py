import flatbuffers

import Silver.Encoding.Variable

builder = flatbuffers.Builder(1024)

Silver.Encoding.Variable.Start(builder)
Silver.Encoding.Variable.AddByteLength(builder, 8)

values = [255, 0, 0, 0, 0, 0, 0, 0]
Silver.Encoding.Variable.StartDataVector(builder, len(values))
for i in reversed(values):
    builder.PrependByte(i)