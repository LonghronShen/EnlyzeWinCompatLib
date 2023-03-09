if(NOT WIN32)
    message(FATAL_ERROR "Unsupported platform detected")
endif()

function(add_wincompat tgt)
    if(CMAKE_CXX_IS_CLANG_WIN)
        target_compile_options(${tgt}
            PRIVATE "-march=pentium-mmx"
        )

        target_link_libraries(${tgt}
            PUBLIC EnlyzeWinCompatLib
        )
    elseif(MSVC)
        target_link_libraries(${tgt}
            PUBLIC EnlyzeWinCompatLib
        )
    else()
        target_compile_options(${tgt}
            PRIVATE "-march=pentium-mmx"
        )
    endif()
endfunction()