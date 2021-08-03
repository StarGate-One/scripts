echo. >>%_vcpkg_log%

call date-time.cmd
echo Date: %file-current-date%                                           Time: %file-current-time% >>%_vcpkg_log% 2>>&1
echo. >>%_vcpkg_log%

call cmake-version.cmd
echo CMake Version [%_cmake_version%] >>%_vcpkg_log% 2>>&1
echo. >>%_vcpkg_log%

call git-version.cmd
echo Git Version [%_git_version%] >>%_vcpkg_log% 2>>&1
echo. >>%_vcpkg_log%

call ninja-version.cmd
echo Ninja Version [%_ninja_version%] >>%_vcpkg_log% 2>>&1
echo. >>%_vcpkg_log%

call vcpkg-version.cmd
echo Vcpkg Version [%_vcpkg_version%] >>%_vcpkg_log% 2>>&1
echo. >>%_vcpkg_log%

call cpp-version.cmd
echo %_vs_version% Version: [%VSCMD_VER%]  VS Tools Version: [%VCToolsVersion%] >>%_vcpkg_log% 2>>&1
echo Microsoft (R) C/C++ Optimizing Compiler Version [%_cpp_version%] for %VSCMD_ARG_TGT_ARCH% >>%_vcpkg_log% 2>>&1
echo. >>%_vcpkg_log%

call vswhere-version.cmd
echo Visual Studio Locator Version [%_vswhere_version_1%] [query version %_vswhere_version_2%] >>%_vcpkg_log% 2>>&1
echo. >>%_vcpkg_log%

call windows-version.cmd
echo Windows Version [%_windows_version%] >>%_vcpkg_log% 2>>&1
echo. >>%_vcpkg_log%

call winsdk-version.cmd
echo Windows SDK Version [%_winsdk_version%] >>%_vcpkg_log% 2>>&1
echo. >>%_vcpkg_log%