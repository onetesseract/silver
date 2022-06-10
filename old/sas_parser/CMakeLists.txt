cmake_minimum_required(VERSION 3.10)

project(silver VERSION 0.0)

AUX_SOURCE_DIRECTORY(src SOURCE_FILES)

add_executable(silver ${SOURCE_FILES})

target_include_directories(${PROJECT_NAME}
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src/include
  PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)
