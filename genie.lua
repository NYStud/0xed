--
dofile("config.lua");

PROJ_DIR = path.getabsolute("..")
BUILD_DIR = path.join(PROJ_DIR, "build")

solution "0xed solution"
	location "build"
	
	configurations {
		"Debug",
		"Release"
	}

	platforms {
		"x64"
	}
	
	language "C++"
	
	configuration {"Debug"}
		targetsuffix "_debug"
		flags {
			"Symbols"
		}
		defines {
			"DEBUG",
			"CONF_DEBUG"
		}
	
	configuration {"Release"}
		targetsuffix "_release"
		flags {
			"Optimize"
		}
		defines {
			"NDEBUG",
			"CONF_RELEASE"
		}
	
	configuration {}
	
	targetdir(BUILD_DIR)
	
	includedirs {
		"src"
	}
	
	links {
		"user32",
		"shell32",
		"winmm",
		"ole32",
		"oleaut32",
		"imm32",
		"version",
		"ws2_32",
		"advapi32"
	}
	
	flags {
		"NoExceptions",
		"NoRTTI",
		"EnableSSE",
		"EnableSSE2",
		"EnableAVX",
		"EnableAVX2",
	}
	
	defines {
		"NK_INCLUDE_FIXED_TYPES",
		"NK_INCLUDE_STANDARD_IO",
		"NK_INCLUDE_STANDARD_VARARGS",
		"NK_INCLUDE_DEFAULT_ALLOCATOR",
		"NK_INCLUDE_VERTEX_BUFFER_OUTPUT",
		"NK_INCLUDE_FONT_BAKING",
		"NK_INCLUDE_DEFAULT_FONT"
	}
	
	-- disable exception related warnings
	buildoptions{ "/wd4577", "/wd4530" }
	

project "0xed"
	kind "WindowedApp"

	configuration {}
	
	files {
		"src/**.h",
		"src/**.c",
		"src/**.cpp",
	}
	
	includedirs {
		SDL2_include,
	}
	
	links {
		"gdi32",
		"glu32",
		"opengl32",
		SDL2_lib,
	}