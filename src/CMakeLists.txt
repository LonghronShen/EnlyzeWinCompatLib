set(project_name "EnlyzeWinCompatLib")
project(${project_name} C CXX ASM_MASM)

file(GLOB src
    ${CMAKE_CURRENT_LIST_DIR}/*.c
    ${CMAKE_CURRENT_LIST_DIR}/*.cpp
    ${CMAKE_CURRENT_LIST_DIR}/*.h
    ${CMAKE_CURRENT_LIST_DIR}/*.asm
)

add_library(${project_name}
    STATIC ${src}
)

target_link_libraries(${project_name}
    PUBLIC libcxx
)

target_include_directories(${project_name}
    PUBLIC ${CMAKE_CURRENT_BINARY_DIR}
)

target_compile_definitions(${project_name}
    PRIVATE "_CRT_SECURE_NO_WARNINGS"
    PRIVATE "_CRT_NONSTDC_NO_DEPRECATE"
    PRIVATE "_LIB"
    PRIVATE "_UNICODE"
    PRIVATE "UNICODE"
    PUBLIC "_WIN32_WINNT=0x0400"
)

if(CMAKE_CXX_IS_CLANG_WIN)
    target_compile_options(${project_name}
        PRIVATE "-flto"
        PRIVATE "-march=pentium-mmx"
    )
endif()