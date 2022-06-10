cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20 -Wall")

project(silver VERSION 0.0)

add_executable(silver ${SOURCE_FILES})

file(GLOB_RECURSE sources src/*.cpp)
target_sources(silver PRIVATE ${sources})

# find_package(wild REQUIRED) TODO: make work

target_include_directories(${PROJECT_NAME}
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src/include
    ${CMAKE_CURRENT_SOURCE_DIR}/include
  PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# target_include_directories(${PROJECT_NAME} PUBLIC "include/" "wild/include" "wild/src/include") # hack to make assimp work
# target_link_libraries(tame wild) # bgfx bx bimg glfw)
