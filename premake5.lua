target_triple = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "glfw"
    kind "StaticLib"
    language "C"

    targetdir ("bin/"..target_triple.."/%{prj.name}")
    objdir ("bin/obj/"..target_triple.."/%{prj.name}")

    defines {
        "_CRT_SECURE_NO_WARNINGS",
    }

    files {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/internal.h",
        "src/mappings.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c",
    }

    includedirs "include"

    filter "system:windows"
        defines "_GLFW_WIN32"

        files {
            "include/win32_platform.h",
            "include/win32_joystick.h",
            "include/wgl_context.h",
            "include/egl_context.h",
            "include/osmesa_context.h",
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
        }
    
    filter "configurations:debug"
        defines "DEBUG"
        symbols "On"

    filter "configurations:release"
        defines "NDEBUG"
        optimize "On"
