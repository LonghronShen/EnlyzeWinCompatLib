find_package(Threads REQUIRED)

include(FetchContent)
include(CheckIncludeFileCXX)

cmake_policy(SET CMP0097 NEW)

if(CMAKE_CXX_IS_CLANG_WIN)
    # winpthreads
    FetchContent_Declare(winpthreads
        GIT_REPOSITORY https://github.com/LonghronShen/winpthreads.git
        GIT_TAG master
        GIT_SHALLOW TRUE
        GIT_SUBMODULES "")

    FetchContent_GetProperties(winpthreads)
    if(NOT winpthreads_POPULATED)
        FetchContent_Populate(winpthreads)
        add_subdirectory(${winpthreads_SOURCE_DIR} ${winpthreads_BINARY_DIR} EXCLUDE_FROM_ALL)
    endif()

    # libcxx
    FetchContent_Declare(libcxx
        GIT_REPOSITORY https://github.com/LonghronShen/libcxx.git
        GIT_TAG master
        GIT_SHALLOW TRUE
        GIT_SUBMODULES "")

    FetchContent_GetProperties(libcxx)
    if(NOT libcxx_POPULATED)
        FetchContent_Populate(libcxx)
        add_subdirectory(${libcxx_SOURCE_DIR} ${libcxx_BINARY_DIR} EXCLUDE_FROM_ALL)
    endif()
endif()