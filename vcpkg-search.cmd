@echo off
setlocal
set _root_drive=D:
set _vcpkg_root=%_root_drive%\vcpkg
set _vcpkg_log=D:\Projects\Git\logs\vcpkg-search.log

call vcpkg-env.cmd >nul

%_root_drive%
cd %_root_drive%\
cd %_vcpkg_root%

echo. >%_vcpkg_log%
echo                                               Vcpkg Search of available ports >>%_vcpkg_log%

call vcpkg-list-versions.cmd

echo  Port Name/Feature(s)       Version                                       Description >>%_vcpkg_log%
echo -----------------------  ---------------  ----------------------------------------------------------------------------- >>%_vcpkg_log%

rem
.\vcpkg.exe search >>%_vcpkg_log% 2>>&1

endlocal