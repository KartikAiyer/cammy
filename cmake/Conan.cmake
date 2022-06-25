# Download automatically, you can also just copy the conan.cmake file
if( NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake" )
  message( STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan" )
  file( DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/0.18.1/conan.cmake" "${CMAKE_BINARY_DIR}/conan.cmake" )
endif()

list( APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR} )
list( APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR} )

include( ${CMAKE_BINARY_DIR}/conan.cmake )
macro( run_conan )

  conan_cmake_configure( REQUIRES
                         ${CONAN_EXTRA_REQUIRES}
                         catch2/3.0.1
                         docopt.cpp/0.6.3
                         spdlog/1.10.0
                         uvw/2.12.1
                         GENERATORS
                         cmake_find_package
                         OPTIONS
                         ${CONAN_EXTRA_OPTIONS} )
  configure_file(${CMAKE_CURRENT_LIST_DIR}/cmake/conan_profile.txt.in ${CMAKE_BINARY_DIR}/conan_profile.txt)
  conan_cmake_install(PATH_OR_REFERENCE .
                      BUILD missing
                      PROFILE ${CMAKE_BINARY_DIR}/conan_profile.txt)

endmacro()
