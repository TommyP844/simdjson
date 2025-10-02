project "simdjson"
   kind "StaticLib"
   architecture "x64"
   language "C++"
   cppdialect "C++20"
   staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir    ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")
   
   -- Source files
   files { 
      "src/simdjson.cpp"
   }
   
   -- Header files (for IDE projects)
   files {
      "include/simdjson.h",
      "include/simdjson/**.h"
   }
   
   -- Include directories
   includedirs { 
      "include",
      "src"
   }
   
   -- Platform-specific settings
   filter "system:windows"
      defines { "_CRT_SECURE_NO_WARNINGS" }
   
   filter "system:linux"
      buildoptions { "-pthread" }
      defines { "SIMDJSON_THREADS_ENABLED=1" }
   
   filter "system:macosx"
      buildoptions { "-pthread" }
      defines { "SIMDJSON_THREADS_ENABLED=1" }
   
   filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
    
    filter "configurations:Release"
        runtime "Release"
        optimize "On"
