@echo off

call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

set _root_drive=D:
set _vcpkg_root=%_root_drive%\vcpkg

set CMAKE_TOOLCHAIN_FILE=%_vcpkg_root%\scripts\buildsystems\vcpkg.cmake
set "CMAKE_TOOLCHAIN_FILE=%CMAKE_TOOLCHAIN_FILE:\=/%"
rem VS Code is Default Editor for VCPKG
rem set EDITOR=C:\Program Files\Microsoft VS Code\Code.exe
rem Set Editor to Notepad++
set EDITOR=%NPP_FULL_FILE_PATH%
set PreferredToolArchitecture=%Platform%
set TEMP=%_vcpkg_root%\temp
set TMP=%TEMP%
set VCPKG_BINARY_SOURCES=clear;files,%_vcpkg_root%\archives,readwrite
set VCPKG_CHAINLOAD_TOOLCHAIN_FILE=%CMAKE_TOOLCHAIN_FILE%
set VCPKG_CMAKE_SYSTEM_NAME=""
set VCPKG_CRT_LINKAGE=dynamic
set VCPKG_DEFAULT_BINARY_CACHE=%_vcpkg_root%
set VCPKG_DEFAULT_HOST_TRIPLET=%VSCMD_ARG_HOST_ARCH%-windows
set VCPKG_DEFAULT_TRIPLET=%VSCMD_ARG_TGT_ARCH%-windows
set VCPKG_DISABLE_METRICS=true
set VCPKG_DOWNLOADS=%_root_drive%\vcpkg-downloads
set VCPKG_ENV_PASSTHROUGH=_IsNativeEnvironment;CMAKE_TOOLCHAIN_FILE;EDITOR;PreferredToolArchitecture;TEMP;TMP;VCPKG_BINARY_SOURCES;VCPKG_CHAINLOAD_TOOLCHAIN_FILE;VCPKG_CMAKE_SYSTEM_NAME;VCPKG_CRT_LINKAGE;VCPKG_DEFAULT_BINARY_CACHE;VCPKG_DEFAULT_HOST_TRIPLET;VCPKG_DEFAULT_TRIPLET;VCPKG_DISABLE_METRICS;VCPKG_DOWNLOADS;VCPKG_ENV_PASSTHROUGH;VCPKG_ENV_PASSTHROUGH_UNTRACKED;VCPKG_FEATURE_FLAGS;VCPKG_FORCE_SYSTEM_BINARIES;VCPKG_HOST_TRIPLET;VCPKG_INSTALLED_DIR;VCPKG_KEEP_ENV_VARS;VCPKG_LIBRARY_LINKAGE;VCPKG_LOAD_VCVARS_ENV;VCPKG_NO_CLEAN;VCPKG_NUGET_REPOSITORY;VCPKG_OVERLAY_PORTS;VCPKG_OVERLAY_TRIPLETS;VCPKG_PLATFORM_TOOLSET;VCPKG_ROOT;VCPKG_TARGET_ARCHITECTURE;VCPKG_TARGET_TRIPLET;VCPKG_USE_NUGET_CACHE;VCPKG_VISUAL_STUDIO_PATH;VSCMD_SKIP_SENDTELEMETRY;X_VCPKG_ASSET_SOURCES
set VCPKG_ENV_PASSTHROUGH_UNTRACKED=
set VCPKG_FEATURE_FLAGS=-binarycaching,-compilertracking,-manifests,-registries,-versions
set VCPKG_FORCE_SYSTEM_BINARIES=
set VCPKG_HOST_TRIPLET=%VSCMD_ARG_HOST_ARCH%-windows
set VCPKG_INSTALLED_DIR=%_vcpkg_root%
set VCPKG_KEEP_ENV_VARS=%VCPKG_ENV_PASSTHROUGH%
set VCPKG_LIBRARY_LINKAGE=dynamic
set VCPKG_LOAD_VCVARS_ENV=1
set VCPKG_MAX_CONCURRENCY=8
set VCPKG_NO_CLEAN=
set VCPKG_NUGET_REPOSITORY=
set VCPKG_OVERLAY_PORTS=
set VCPKG_OVERLAY_TRIPLETS=
set VCPKG_PLATFORM_TOOLSET=v143
set VCPKG_ROOT=%_vcpkg_root%
set VCPKG_TARGET_ARCHITECTURE=%Platform%
set VCPKG_TARGET_TRIPLET=%VSCMD_ARG_TGT_ARCH%-windows
set VCPKG_USE_NUGET_CACHE=
set VCPKG_VISUAL_STUDIO_PATH=%VSINSTALLDIR:~0,-1%
set VS140COMNTOOLS=
set VSCMD_SKIP_SENDTELEMETRY=1
set X_VCPKG_ASSET_SOURCES=clear
set _IsNativeEnvironment=true

%_root_drive%
cd %_root_drive%\
cd %_vcpkg_root%