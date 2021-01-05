
project "GLFW"
    kind "StaticLib"
    language "C"

    targetdir("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin-int/" .. outputdir .. "/%{prj.name}")

    -- platform-agnostic files
    files
    {
        "include/GLWF/glfw3.h",
        "include/GLWF/glfw3native.h",
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

    filter "system:windows"
        buildoptions { "-std=c11", "-lgdi32"}
        systemversion "latest"
        staticruntime "On"

        files
        {
            "win32_platform.h",
            "win32_joystick.h",
            "wgl_context.h",
            "egl_context.h",
            "osmesa_context.h",
            "win32_init.c",
            "win32_joystick.c",
            "win32_monitor.c",
            "win32_time.c",
            "win32_thread.c",
            "win32_window.c",
            "wgl_context.c",
            "egl_context.c",
            "osmesa_context.c"
        }

        defines
        {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
