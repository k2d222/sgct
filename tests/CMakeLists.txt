##########################################################################################
# SGCT                                                                                   #
# Simple Graphics Cluster Toolkit                                                        #
#                                                                                        #
# Copyright (c) 2012-2022                                                                #
# For conditions of distribution and use, see copyright notice in LICENSE.md             #
##########################################################################################

add_executable(
  SGCTTest
  equality.cpp
  main.cpp
  test_config_load.cpp
  test_config_parse.cpp
  test_config_required_parameters.cpp
  test_config_roundtrip.cpp
)

target_compile_features(SGCTTest PRIVATE cxx_std_17)

target_compile_definitions(SGCTTest PUBLIC BASE_PATH="${PROJECT_SOURCE_DIR}")

if (MSVC)
  target_compile_options(SGCTTest PRIVATE "-Od" "/bigobj")
else ()
  target_compile_options(SGCTTest PRIVATE "-O0" )
endif ()

target_include_directories(SGCTTest PRIVATE "${PROJECT_SOURCE_DIR}/ext/catch2/single_include")
target_link_libraries(SGCTTest PRIVATE sgct json glm)

if (APPLE)
  target_link_libraries(SGCTTest PRIVATE ${CARBON_LIBRARY} ${COREFOUNDATION_LIBRARY} ${COCOA_LIBRARY} ${APP_SERVICES_LIBRARY})
endif ()
