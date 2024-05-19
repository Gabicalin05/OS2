cmake_minimum_required(VERSION 3.13)
project(Image_Processor CXX)

add_executable(image_processor main.cpp)

set_target_properties(image_processor PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)