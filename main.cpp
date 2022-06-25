#include <spdlog/spdlog.h>
#include <libcamera/libcamera/libcamera.h>

namespace lc = libcamera;
int main(int argc, char** argv)
{
    lc::CameraManager mgr{};
    mgr.start();
    auto cameras = mgr.cameras();
    spdlog::info("Found {} cameras", cameras.size());
    return 0;
}

