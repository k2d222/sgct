##########################################################################################
# SGCT                                                                                   #
# Simple Graphics Cluster Toolkit                                                        #
#                                                                                        #
# Copyright (c) 2012-2022                                                                #
# For conditions of distribution and use, see copyright notice in LICENSE.md             #
##########################################################################################

function (set_compile_options target)
  target_compile_features(${target} PRIVATE cxx_std_17)

  set(MSVC_WARNINGS
    "/MP"                 # Multi-threading support
    "/W4"                 # Baseline reasonable warnings
    "/wd4201"   # nonstandard extension used : nameless struct/union  [raised by: GLM]
    "/Zc:strictStrings-"  # Windows header don't adhere to this
    "/Zc:__cplusplus"     # Correctly set the __cplusplus macro
  )
  if (SGCT_ENABLE_EDIT_CONTINUE)
    # Edit and continue support
    set(MSVC_WARNINGS "${MSVC_WARNINGS}" "/ZI")
  endif ()

  set(CLANG_WARNINGS
  "-stdlib=libc++"
  "-Wall"
  "-Wextra"
  "-Wmost"
  "-Wpedantic"
  
  "-Wabstract-vbase-init"
  "-Walloca"
  "-Wanon-enum-enum-conversion"
  "-Warray-bounds-pointer-arithmetic"
  "-Wassign-enum"
  "-Wbad-function-cast"
  "-Wbinary-literal"
  "-Wbind-to-temporary-copy"
  "-Wbitfield-constant-conversion"
  "-Wbool-conversions"
  "-Wcast-align"
  "-Wcast-function-type"
  "-Wcast-qual"
  "-Wcomma"
  "-Wconditional-uninitialized"
  "-Wdate-time"
  "-Wdeprecated-dynamic-exception-spec"
  "-Wdeprecated-this-capture"
  "-Wdivision-by-zero"
  "-Wdtor-name"
  "-Wduplicate-decl-specifier"
  "-Wduplicate-enum"
  "-Wduplicate-method-arg"
  "-Wduplicate-method-match"
  "-Wextra-semi"
  "-Wfloat-overflow-conversion"
  "-Wfloat-zero-conversion"
  "-Wformat"
  "-Wformat-non-iso"
  "-Wformat-nonliteral"
  "-Wformat-pedantic"
  "-Wformat-type-confusion"
  "-Wheader-hygiene"
  "-Widiomatic-parentheses"
  "-Wimplicit"
  "-Wimplicit-fallthrough"
  "-Wloop-analysis"
  "-Wmain"
  "-Wmethod-signatures"
  "-Wmissing-noreturn"
  "-Wmove"
  "-Wnon-virtual-dtor"
  "-Wold-style-cast"
  "-Wpointer-arith"
  "-Wpragmas"
  "-Wrange-loop-analysis"
  "-Wreorder"
  "-Wshadow-all"
  "-Wshift-sign-overflow"
  "-Wshorten-64-to-32"
  "-Wsometimes-uninitialized"
  "-Wstring-conversion"
  "-Wsuggest-destructor-override"
  "-Wsuggest-override"
  "-Wtautological-compare"
  "-Wtautological-constant-in-range-compare"
  "-Wtautological-constant-out-of-range-compare"
  "-Wthread-safety"
  "-Wtype-limits"
  "-Wundef"
  "-Wundefined-reinterpret-cast"
  "-Wuninitialized-const-reference"
  "-Wunneeded-internal-declaration"
  "-Wunneeded-member-function"
  "-Wunreachable-code"
  "-Wunreachable-code-break"
  "-Wunreachable-code-return"
  "-Wunused"
  "-Wunused-const-variable"
  "-Wunused-exception-parameter"
  "-Wunused-macros"
  "-Wunused-result"
  "-Wused-but-marked-unused"
  "-Wvariadic-macros"
  "-Wvla"
  
  "-Wno-missing-braces"
  )

  set(GCC_WARNINGS
  "-ggdb"
  "-Wall"
  "-Wextra"
  "-Wpedantic"

  "-Walloc-zero"
  "-Wcast-qual"
  "-Wdate-time"
  "-Wduplicated-branches"
  "-Wduplicated-cond"
  "-Wformat"
  "-Wlogical-op"
  "-Wmain"
  "-Wno-deprecated-copy"
  "-Wno-float-equal"
  "-Wno-long-long"
  "-Wno-write-strings"
  "-Wnon-virtual-dtor"
  "-Wold-style-cast"
  "-Woverloaded-virtual"
  "-Wshadow"
  "-Wsuggest-override"
  "-Wtautological-compare"
  "-Wtype-limits"
  "-Wundef"
  "-Wunused"
  "-Wuninitialized"
  "-Wvla"
  )

  if (MSVC)
    target_compile_options(${target} PRIVATE ${MSVC_WARNINGS})
  elseif (APPLE AND CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(${target} PRIVATE ${CLANG_WARNINGS})
  elseif (UNIX AND CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(${target} PRIVATE ${CLANG_WARNINGS} "-std=c++17")
    target_link_libraries(${target} PRIVATE "c++" "c++abi")
  elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    target_compile_options(${target} PRIVATE ${GCC_WARNINGS})
    if (SGCT_ENABLE_STATIC_ANALYZER)
      target_compile_options(${target} PRIVATE "-fanalyzer")
    endif ()
  endif ()
endfunction ()
