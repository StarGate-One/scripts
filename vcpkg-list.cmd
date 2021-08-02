@echo off
setlocal
set _root_drive=D:
set _vcpkg_root=%_root_drive%\vcpkg
set _vcpkg_sdl2_log=D:\Projects\Git\logs\vcpkg-list.log

set CMAKE_TOOLCHAIN_FILE=%_vcpkg_root%\buildsystems\vcpkg.cmake
set PreferredToolArchitecture=x64
set TEMP=%_vcpkg_root%\temp
set TMP=%TEMP%
set VCPKG_BINARY_SOURCES=clear;files,%_vcpkg_root%\archives,readwrite
set VCPKG_CHAINLOAD_TOOLCHAIN_FILE=%CMAKE_TOOLCHAIN_FILE%
set VCPKG_CMAKE_SYSTEM_NAME=""
set VCPKG_CRT_LINKAGE=dynamic
set VCPKG_DEFAULT_BINARY_CACHE=%_vcpkg_root%
set VCPKG_DEFAULT_HOST_TRIPLET=x64-windows
set VCPKG_DEFAULT_TRIPLET=x64-windows
set VCPKG_DOWNLOADS=%_vcpkg_root%\downloads
set VCPKG_ENV_PASSTHROUGH=_IsNativeEnvironment;CMAKE_TOOLCHAIN_FILE;PreferredToolArchitecture;TEMP;TMP;VCPKG_BINARY_SOURCES;VCPKG_CHAINLOAD_TOOLCHAIN_FILE;VCPKG_CMAKE_SYSTEM_NAME;VCPKG_CRT_LINKAGE;VCPKG_DEFAULT_TRIPLET;VCPKG_DISABLE_METRICS;VCPKG_DOWNLOADS;VCPKG_ENV_PASSTHROUGH;VCPKG_FEATURE_FLAGS;VCPKG_KEEP_ENV_VARS;VCPKG_LIBRARY_LINKAGE;VCPKG_LOAD_VCVARS_ENV;VCPKG_NO_CLEAN;VCPKG_PLATFORM_TOOLSET;VCPKG_ROOT;VCPKG_TARGET_ARCHITECTURE;VCPKG_VISUAL_STUDIO_PATH;VSCMD_SKIP_SENDTELEMETRY
rem set VCPKG_FEATURE_FLAGS=-binarycaching,-compilertracking,-manifests,-registries,-versions
set VCPKG_FEATURE_FLAGS=-binarycaching,-compilertracking,-manifests,-registries
set VCPKG_KEEP_ENV_VARS=%VCPKG_ENV_PASSTHROUGH%
set VCPKG_LIBRARY_LINKAGE=dynamic
set VCPKG_LOAD_VCVARS_ENV=1
set VCPKG_MAX_CONCURRENCY=8
set VCPKG_PLATFORM_TOOLSET=v142
rem set VCPKG_VISUAL_STUDIO_PATH=%VSINSTALLDIR%
set VCPKG_VISUAL_STUDIO_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community
set VS140COMNTOOLS=
set _IsNativeEnvironment=true

set "CMAKE_TOOLCHAIN_FILE=%CMAKE_TOOLCHAIN_FILE:\=/%"

%_root_drive%
cd %_root_drive%\
cd %_vcpkg_root%

rem set >%_vcpkg_sdl2_log%
echo. >%_vcpkg_sdl2_log%
echo. >>%_vcpkg_sdl2_log%

rem
.\vcpkg.exe list >>%_vcpkg_sdl2_log% 2>>&1

endlocal