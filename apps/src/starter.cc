#include <spdlog/spdlog.h>
#include <libcamera/libcamera/libcamera.h>
#include <uvw.hpp>
#include <ranges>

namespace lc = libcamera;

int main(int argc, char **argv)
{
    lc::CameraManager mgr{};
    mgr.start();
    auto cameras = mgr.cameras();
    spdlog::info("Found {} cameras", cameras.size());
    for (auto camera : cameras)
    {
        camera->acquire();
        auto configuration = camera->generateConfiguration();
        camera->configure(configuration.get());
        camera->start();
        spdlog::info("Config is Empty: {}", configuration->empty());

        for (auto &stream_config : *configuration)
        {
          spdlog::info("Pix Format: {}", stream_config.pixelFormat.toString()); 
        }
        camera->release();
    }

    return 0;
}
