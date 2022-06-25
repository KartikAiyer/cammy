cmake_minimum_required(VERSION 3.22)
project(cammy CXX)

set(CMAKE_CXX_STANDARD 20)

find_package(PkgConfig REQUIRED)

pkg_check_modules(LIBCAMERA REQUIRED libcamera)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(someUtils)
include(Conan)

run_conan()

find_package(spdlog REQUIRED)

add_executable(hello_world main.cpp)
target_link_libraries(hello_world PRIVATE ${LIBCAMERA_LINK_LIBRARIES} spdlog::spdlog)
target_include_directories(hello_world PRIVATE ${LIBCAMERA_INCLUDE_DIRS})