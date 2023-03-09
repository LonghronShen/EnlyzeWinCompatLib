cmake_minimum_required(VERSION 3.14)

set(project_name "EnlyzeWinCompatLib")
project(${project_name} C CXX ASM_MASM)

set(CMAKE_ASM_MASM_COMPILE_OBJECT "<CMAKE_ASM_MASM_COMPILER> /Cp /safeseh /Fo <OBJECT> /c /Ta <SOURCE>" CACHE STRING "CMAKE_ASM_MASM_COMPILE_OBJECT" FORCE)
message(STATUS "Compiling MASM file using command line: ${CMAKE_ASM_MASM_COMPILE_OBJECT}")

file(GLOB_RECURSE src
    ${CMAKE_CURRENT_LIST_DIR}/*.c
    ${CMAKE_CURRENT_LIST_DIR}/*.cpp
    ${CMAKE_CURRENT_LIST_DIR}/*.h
    ${CMAKE_CURRENT_LIST_DIR}/*.asm
)

if(NOT WIN32)
    message(FATAL_ERROR "Unsupported platform detected")
endif()

add_library(${project_name}
    STATIC ${src}
)

target_link_libraries(${project_name}
    PUBLIC "libcxx"
)

target_include_directories(${project_name}
    PUBLIC ${CMAKE_CURRENT_BINARY_DIR}
)

target_compile_definitions(${project_name}
    PUBLIC "_CRT_SECURE_NO_WARNINGS"
    PUBLIC "_CRT_NONSTDC_NO_DEPRECATE"
    PUBLIC "_LIBCPP_BUILDING_LIBRARY"
    PUBLIC "_WIN32_WINNT=0x0400"
    PUBLIC "_LIB"
    PUBLIC "_UNICODE"
    PUBLIC "UNICODE"
)

if(CMAKE_CXX_IS_CLANG_WIN)
    target_compile_options(${project_name}
        PRIVATE "-flto"
        PRIVATE "-march=pentium-mmx"
    )
endif()
