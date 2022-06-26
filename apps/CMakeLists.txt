project(apps CXX)

add_executable(starter src/starter.cc)
target_compile_features(starter PRIVATE cxx_std_20)
target_include_directories(starter PRIVATE ${LIBCAMERA_INCLUDE_DIRS} )
target_link_libraries(starter PRIVATE ${LIBCAMERA_LINK_LIBRARIES} spdlog::spdlog uvw::uvw)

