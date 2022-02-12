// automatically generated by the FlatBuffers compiler, do not modify


#ifndef FLATBUFFERS_GENERATED_CONTEXT_SILVER_ENCODING_H_
#define FLATBUFFERS_GENERATED_CONTEXT_SILVER_ENCODING_H_

#include "flatbuffers/flatbuffers.h"

namespace Silver {
namespace Encoding {

struct Variable;
struct VariableBuilder;

struct Frame;
struct FrameBuilder;

struct Function;
struct FunctionBuilder;

struct Dynamic;
struct DynamicBuilder;

struct Context;
struct ContextBuilder;

struct Variable FLATBUFFERS_FINAL_CLASS : private flatbuffers::Table {
  typedef VariableBuilder Builder;
  enum FlatBuffersVTableOffset FLATBUFFERS_VTABLE_UNDERLYING_TYPE {
    VT_BYTE_LENGTH = 4,
    VT_DATA_INDEX = 6,
    VT_PUBLISHED_NAME = 8
  };
  uint32_t byte_length() const {
    return GetField<uint32_t>(VT_BYTE_LENGTH, 0);
  }
  uint32_t data_index() const {
    return GetField<uint32_t>(VT_DATA_INDEX, 0);
  }
  const flatbuffers::Vector<int8_t> *published_name() const {
    return GetPointer<const flatbuffers::Vector<int8_t> *>(VT_PUBLISHED_NAME);
  }
  bool Verify(flatbuffers::Verifier &verifier) const {
    return VerifyTableStart(verifier) &&
           VerifyField<uint32_t>(verifier, VT_BYTE_LENGTH) &&
           VerifyField<uint32_t>(verifier, VT_DATA_INDEX) &&
           VerifyOffset(verifier, VT_PUBLISHED_NAME) &&
           verifier.VerifyVector(published_name()) &&
           verifier.EndTable();
  }
};

struct VariableBuilder {
  typedef Variable Table;
  flatbuffers::FlatBufferBuilder &fbb_;
  flatbuffers::uoffset_t start_;
  void add_byte_length(uint32_t byte_length) {
    fbb_.AddElement<uint32_t>(Variable::VT_BYTE_LENGTH, byte_length, 0);
  }
  void add_data_index(uint32_t data_index) {
    fbb_.AddElement<uint32_t>(Variable::VT_DATA_INDEX, data_index, 0);
  }
  void add_published_name(flatbuffers::Offset<flatbuffers::Vector<int8_t>> published_name) {
    fbb_.AddOffset(Variable::VT_PUBLISHED_NAME, published_name);
  }
  explicit VariableBuilder(flatbuffers::FlatBufferBuilder &_fbb)
        : fbb_(_fbb) {
    start_ = fbb_.StartTable();
  }
  flatbuffers::Offset<Variable> Finish() {
    const auto end = fbb_.EndTable(start_);
    auto o = flatbuffers::Offset<Variable>(end);
    return o;
  }
};

inline flatbuffers::Offset<Variable> CreateVariable(
    flatbuffers::FlatBufferBuilder &_fbb,
    uint32_t byte_length = 0,
    uint32_t data_index = 0,
    flatbuffers::Offset<flatbuffers::Vector<int8_t>> published_name = 0) {
  VariableBuilder builder_(_fbb);
  builder_.add_published_name(published_name);
  builder_.add_data_index(data_index);
  builder_.add_byte_length(byte_length);
  return builder_.Finish();
}

inline flatbuffers::Offset<Variable> CreateVariableDirect(
    flatbuffers::FlatBufferBuilder &_fbb,
    uint32_t byte_length = 0,
    uint32_t data_index = 0,
    const std::vector<int8_t> *published_name = nullptr) {
  auto published_name__ = published_name ? _fbb.CreateVector<int8_t>(*published_name) : 0;
  return Silver::Encoding::CreateVariable(
      _fbb,
      byte_length,
      data_index,
      published_name__);
}

struct Frame FLATBUFFERS_FINAL_CLASS : private flatbuffers::Table {
  typedef FrameBuilder Builder;
  enum FlatBuffersVTableOffset FLATBUFFERS_VTABLE_UNDERLYING_TYPE {
    VT_VARIABLES = 4,
    VT_INSTRUCTIONS_INDEX = 6
  };
  const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>> *variables() const {
    return GetPointer<const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>> *>(VT_VARIABLES);
  }
  uint32_t instructions_index() const {
    return GetField<uint32_t>(VT_INSTRUCTIONS_INDEX, 0);
  }
  bool Verify(flatbuffers::Verifier &verifier) const {
    return VerifyTableStart(verifier) &&
           VerifyOffset(verifier, VT_VARIABLES) &&
           verifier.VerifyVector(variables()) &&
           verifier.VerifyVectorOfTables(variables()) &&
           VerifyField<uint32_t>(verifier, VT_INSTRUCTIONS_INDEX) &&
           verifier.EndTable();
  }
};

struct FrameBuilder {
  typedef Frame Table;
  flatbuffers::FlatBufferBuilder &fbb_;
  flatbuffers::uoffset_t start_;
  void add_variables(flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>>> variables) {
    fbb_.AddOffset(Frame::VT_VARIABLES, variables);
  }
  void add_instructions_index(uint32_t instructions_index) {
    fbb_.AddElement<uint32_t>(Frame::VT_INSTRUCTIONS_INDEX, instructions_index, 0);
  }
  explicit FrameBuilder(flatbuffers::FlatBufferBuilder &_fbb)
        : fbb_(_fbb) {
    start_ = fbb_.StartTable();
  }
  flatbuffers::Offset<Frame> Finish() {
    const auto end = fbb_.EndTable(start_);
    auto o = flatbuffers::Offset<Frame>(end);
    return o;
  }
};

inline flatbuffers::Offset<Frame> CreateFrame(
    flatbuffers::FlatBufferBuilder &_fbb,
    flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>>> variables = 0,
    uint32_t instructions_index = 0) {
  FrameBuilder builder_(_fbb);
  builder_.add_instructions_index(instructions_index);
  builder_.add_variables(variables);
  return builder_.Finish();
}

inline flatbuffers::Offset<Frame> CreateFrameDirect(
    flatbuffers::FlatBufferBuilder &_fbb,
    const std::vector<flatbuffers::Offset<Silver::Encoding::Variable>> *variables = nullptr,
    uint32_t instructions_index = 0) {
  auto variables__ = variables ? _fbb.CreateVector<flatbuffers::Offset<Silver::Encoding::Variable>>(*variables) : 0;
  return Silver::Encoding::CreateFrame(
      _fbb,
      variables__,
      instructions_index);
}

struct Function FLATBUFFERS_FINAL_CLASS : private flatbuffers::Table {
  typedef FunctionBuilder Builder;
  enum FlatBuffersVTableOffset FLATBUFFERS_VTABLE_UNDERLYING_TYPE {
    VT_ARGS = 4,
    VT_FRAMES = 6,
    VT_PUBLISHED_NAME = 8,
    VT_RETURN_BYTE_WIDTH = 10
  };
  const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>> *args() const {
    return GetPointer<const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>> *>(VT_ARGS);
  }
  const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Frame>> *frames() const {
    return GetPointer<const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Frame>> *>(VT_FRAMES);
  }
  const flatbuffers::Vector<int8_t> *published_name() const {
    return GetPointer<const flatbuffers::Vector<int8_t> *>(VT_PUBLISHED_NAME);
  }
  uint32_t return_byte_width() const {
    return GetField<uint32_t>(VT_RETURN_BYTE_WIDTH, 0);
  }
  bool Verify(flatbuffers::Verifier &verifier) const {
    return VerifyTableStart(verifier) &&
           VerifyOffset(verifier, VT_ARGS) &&
           verifier.VerifyVector(args()) &&
           verifier.VerifyVectorOfTables(args()) &&
           VerifyOffset(verifier, VT_FRAMES) &&
           verifier.VerifyVector(frames()) &&
           verifier.VerifyVectorOfTables(frames()) &&
           VerifyOffset(verifier, VT_PUBLISHED_NAME) &&
           verifier.VerifyVector(published_name()) &&
           VerifyField<uint32_t>(verifier, VT_RETURN_BYTE_WIDTH) &&
           verifier.EndTable();
  }
};

struct FunctionBuilder {
  typedef Function Table;
  flatbuffers::FlatBufferBuilder &fbb_;
  flatbuffers::uoffset_t start_;
  void add_args(flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>>> args) {
    fbb_.AddOffset(Function::VT_ARGS, args);
  }
  void add_frames(flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Frame>>> frames) {
    fbb_.AddOffset(Function::VT_FRAMES, frames);
  }
  void add_published_name(flatbuffers::Offset<flatbuffers::Vector<int8_t>> published_name) {
    fbb_.AddOffset(Function::VT_PUBLISHED_NAME, published_name);
  }
  void add_return_byte_width(uint32_t return_byte_width) {
    fbb_.AddElement<uint32_t>(Function::VT_RETURN_BYTE_WIDTH, return_byte_width, 0);
  }
  explicit FunctionBuilder(flatbuffers::FlatBufferBuilder &_fbb)
        : fbb_(_fbb) {
    start_ = fbb_.StartTable();
  }
  flatbuffers::Offset<Function> Finish() {
    const auto end = fbb_.EndTable(start_);
    auto o = flatbuffers::Offset<Function>(end);
    return o;
  }
};

inline flatbuffers::Offset<Function> CreateFunction(
    flatbuffers::FlatBufferBuilder &_fbb,
    flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>>> args = 0,
    flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Frame>>> frames = 0,
    flatbuffers::Offset<flatbuffers::Vector<int8_t>> published_name = 0,
    uint32_t return_byte_width = 0) {
  FunctionBuilder builder_(_fbb);
  builder_.add_return_byte_width(return_byte_width);
  builder_.add_published_name(published_name);
  builder_.add_frames(frames);
  builder_.add_args(args);
  return builder_.Finish();
}

inline flatbuffers::Offset<Function> CreateFunctionDirect(
    flatbuffers::FlatBufferBuilder &_fbb,
    const std::vector<flatbuffers::Offset<Silver::Encoding::Variable>> *args = nullptr,
    const std::vector<flatbuffers::Offset<Silver::Encoding::Frame>> *frames = nullptr,
    const std::vector<int8_t> *published_name = nullptr,
    uint32_t return_byte_width = 0) {
  auto args__ = args ? _fbb.CreateVector<flatbuffers::Offset<Silver::Encoding::Variable>>(*args) : 0;
  auto frames__ = frames ? _fbb.CreateVector<flatbuffers::Offset<Silver::Encoding::Frame>>(*frames) : 0;
  auto published_name__ = published_name ? _fbb.CreateVector<int8_t>(*published_name) : 0;
  return Silver::Encoding::CreateFunction(
      _fbb,
      args__,
      frames__,
      published_name__,
      return_byte_width);
}

struct Dynamic FLATBUFFERS_FINAL_CLASS : private flatbuffers::Table {
  typedef DynamicBuilder Builder;
  enum FlatBuffersVTableOffset FLATBUFFERS_VTABLE_UNDERLYING_TYPE {
    VT_NAME = 4
  };
  const flatbuffers::Vector<int8_t> *name() const {
    return GetPointer<const flatbuffers::Vector<int8_t> *>(VT_NAME);
  }
  bool Verify(flatbuffers::Verifier &verifier) const {
    return VerifyTableStart(verifier) &&
           VerifyOffset(verifier, VT_NAME) &&
           verifier.VerifyVector(name()) &&
           verifier.EndTable();
  }
};

struct DynamicBuilder {
  typedef Dynamic Table;
  flatbuffers::FlatBufferBuilder &fbb_;
  flatbuffers::uoffset_t start_;
  void add_name(flatbuffers::Offset<flatbuffers::Vector<int8_t>> name) {
    fbb_.AddOffset(Dynamic::VT_NAME, name);
  }
  explicit DynamicBuilder(flatbuffers::FlatBufferBuilder &_fbb)
        : fbb_(_fbb) {
    start_ = fbb_.StartTable();
  }
  flatbuffers::Offset<Dynamic> Finish() {
    const auto end = fbb_.EndTable(start_);
    auto o = flatbuffers::Offset<Dynamic>(end);
    return o;
  }
};

inline flatbuffers::Offset<Dynamic> CreateDynamic(
    flatbuffers::FlatBufferBuilder &_fbb,
    flatbuffers::Offset<flatbuffers::Vector<int8_t>> name = 0) {
  DynamicBuilder builder_(_fbb);
  builder_.add_name(name);
  return builder_.Finish();
}

inline flatbuffers::Offset<Dynamic> CreateDynamicDirect(
    flatbuffers::FlatBufferBuilder &_fbb,
    const std::vector<int8_t> *name = nullptr) {
  auto name__ = name ? _fbb.CreateVector<int8_t>(*name) : 0;
  return Silver::Encoding::CreateDynamic(
      _fbb,
      name__);
}

struct Context FLATBUFFERS_FINAL_CLASS : private flatbuffers::Table {
  typedef ContextBuilder Builder;
  enum FlatBuffersVTableOffset FLATBUFFERS_VTABLE_UNDERLYING_TYPE {
    VT_DYNAMIC_VARS = 4,
    VT_DYNAMIC_FNS = 6,
    VT_CONSTANTS = 8,
    VT_FUNCTIONS = 10
  };
  const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Dynamic>> *dynamic_vars() const {
    return GetPointer<const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Dynamic>> *>(VT_DYNAMIC_VARS);
  }
  const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Dynamic>> *dynamic_fns() const {
    return GetPointer<const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Dynamic>> *>(VT_DYNAMIC_FNS);
  }
  const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>> *constants() const {
    return GetPointer<const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>> *>(VT_CONSTANTS);
  }
  const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Function>> *functions() const {
    return GetPointer<const flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Function>> *>(VT_FUNCTIONS);
  }
  bool Verify(flatbuffers::Verifier &verifier) const {
    return VerifyTableStart(verifier) &&
           VerifyOffset(verifier, VT_DYNAMIC_VARS) &&
           verifier.VerifyVector(dynamic_vars()) &&
           verifier.VerifyVectorOfTables(dynamic_vars()) &&
           VerifyOffset(verifier, VT_DYNAMIC_FNS) &&
           verifier.VerifyVector(dynamic_fns()) &&
           verifier.VerifyVectorOfTables(dynamic_fns()) &&
           VerifyOffset(verifier, VT_CONSTANTS) &&
           verifier.VerifyVector(constants()) &&
           verifier.VerifyVectorOfTables(constants()) &&
           VerifyOffset(verifier, VT_FUNCTIONS) &&
           verifier.VerifyVector(functions()) &&
           verifier.VerifyVectorOfTables(functions()) &&
           verifier.EndTable();
  }
};

struct ContextBuilder {
  typedef Context Table;
  flatbuffers::FlatBufferBuilder &fbb_;
  flatbuffers::uoffset_t start_;
  void add_dynamic_vars(flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Dynamic>>> dynamic_vars) {
    fbb_.AddOffset(Context::VT_DYNAMIC_VARS, dynamic_vars);
  }
  void add_dynamic_fns(flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Dynamic>>> dynamic_fns) {
    fbb_.AddOffset(Context::VT_DYNAMIC_FNS, dynamic_fns);
  }
  void add_constants(flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>>> constants) {
    fbb_.AddOffset(Context::VT_CONSTANTS, constants);
  }
  void add_functions(flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Function>>> functions) {
    fbb_.AddOffset(Context::VT_FUNCTIONS, functions);
  }
  explicit ContextBuilder(flatbuffers::FlatBufferBuilder &_fbb)
        : fbb_(_fbb) {
    start_ = fbb_.StartTable();
  }
  flatbuffers::Offset<Context> Finish() {
    const auto end = fbb_.EndTable(start_);
    auto o = flatbuffers::Offset<Context>(end);
    return o;
  }
};

inline flatbuffers::Offset<Context> CreateContext(
    flatbuffers::FlatBufferBuilder &_fbb,
    flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Dynamic>>> dynamic_vars = 0,
    flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Dynamic>>> dynamic_fns = 0,
    flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Variable>>> constants = 0,
    flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<Silver::Encoding::Function>>> functions = 0) {
  ContextBuilder builder_(_fbb);
  builder_.add_functions(functions);
  builder_.add_constants(constants);
  builder_.add_dynamic_fns(dynamic_fns);
  builder_.add_dynamic_vars(dynamic_vars);
  return builder_.Finish();
}

inline flatbuffers::Offset<Context> CreateContextDirect(
    flatbuffers::FlatBufferBuilder &_fbb,
    const std::vector<flatbuffers::Offset<Silver::Encoding::Dynamic>> *dynamic_vars = nullptr,
    const std::vector<flatbuffers::Offset<Silver::Encoding::Dynamic>> *dynamic_fns = nullptr,
    const std::vector<flatbuffers::Offset<Silver::Encoding::Variable>> *constants = nullptr,
    const std::vector<flatbuffers::Offset<Silver::Encoding::Function>> *functions = nullptr) {
  auto dynamic_vars__ = dynamic_vars ? _fbb.CreateVector<flatbuffers::Offset<Silver::Encoding::Dynamic>>(*dynamic_vars) : 0;
  auto dynamic_fns__ = dynamic_fns ? _fbb.CreateVector<flatbuffers::Offset<Silver::Encoding::Dynamic>>(*dynamic_fns) : 0;
  auto constants__ = constants ? _fbb.CreateVector<flatbuffers::Offset<Silver::Encoding::Variable>>(*constants) : 0;
  auto functions__ = functions ? _fbb.CreateVector<flatbuffers::Offset<Silver::Encoding::Function>>(*functions) : 0;
  return Silver::Encoding::CreateContext(
      _fbb,
      dynamic_vars__,
      dynamic_fns__,
      constants__,
      functions__);
}

inline const Silver::Encoding::Context *GetContext(const void *buf) {
  return flatbuffers::GetRoot<Silver::Encoding::Context>(buf);
}

inline const Silver::Encoding::Context *GetSizePrefixedContext(const void *buf) {
  return flatbuffers::GetSizePrefixedRoot<Silver::Encoding::Context>(buf);
}

inline bool VerifyContextBuffer(
    flatbuffers::Verifier &verifier) {
  return verifier.VerifyBuffer<Silver::Encoding::Context>(nullptr);
}

inline bool VerifySizePrefixedContextBuffer(
    flatbuffers::Verifier &verifier) {
  return verifier.VerifySizePrefixedBuffer<Silver::Encoding::Context>(nullptr);
}

inline void FinishContextBuffer(
    flatbuffers::FlatBufferBuilder &fbb,
    flatbuffers::Offset<Silver::Encoding::Context> root) {
  fbb.Finish(root);
}

inline void FinishSizePrefixedContextBuffer(
    flatbuffers::FlatBufferBuilder &fbb,
    flatbuffers::Offset<Silver::Encoding::Context> root) {
  fbb.FinishSizePrefixed(root);
}

}  // namespace Encoding
}  // namespace Silver

#endif  // FLATBUFFERS_GENERATED_CONTEXT_SILVER_ENCODING_H_
