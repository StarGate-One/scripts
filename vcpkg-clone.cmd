@echo off
setlocal

set temp=%USERPROFILE%\AppData\Local\Temp
set tmp=%USERPROFILE%\AppData\Local\Temp

set _root_drive=D:
set _vcpkg_root=%_root_drive%\vcpkg
set _vcpkg_archives=%_vcpkg_root%\archives
set _vcpkg_buildtrees=%_vcpkg_root%\buildtrees
set _vcpkg_downloads=%_root_drive%\vcpkg-downloads
set _vcpkg_downloads_link=%_vcpkg_root%\downloads
set _vcpkg_exe=%_vcpkg_root%\vcpkg.exe
set _vcpkg_installed=%_vcpkg_root%\installed
set _vcpkg_packages=%_vcpkg_root%\packages
set _vcpkg_metrics=%_vcpkg_root%\vcpkg.disable-metrics
set _vcpkg_temp=%_vcpkg_root%\temp
set _vcpkg_tool=%_root_drive%\vcpkg-tool
set _vcpkg_tool_build=%_vcpkg_tool%\build

%_root_drive%
cd %_root_drive%\

if exist %_vcpkg_root% (
   rmdir /q /s %_vcpkg_root%
)

if exist %_vcpkg_tool% (
   rmdir /q /s %_vcpkg_tool%
)

git clone -c core.symlinks=false --verbose --progress --recursive git@github.com:StarGate-One/vcpkg.git %_vcpkg_root%

cd %_vcpkg_root%

git remote add upstream git@github.com:microsoft/vcpkg.git

if not exist %_vcpkg_metrics% (
   echo. >%_vcpkg_metrics%
)

if not exist %_vcpkg_archives% (
   mkdir %_vcpkg_archives%
)

if not exist %_vcpkg_buildtrees% (
   mkdir %_vcpkg_buildtrees%
)

if not exist %_vcpkg_downloads_link% (
   if exist %_vcpkg_downloads% (
   mklink /j %_vcpkg_downloads_link% %_vcpkg_downloads%
   )
)

if not exist %_vcpkg_installed% (
   mkdir %_vcpkg_installed%
)

if not exist %_vcpkg_packages% (
   mkdir %_vcpkg_packages%
)

if not exist %_vcpkg_temp% (
   mkdir %_vcpkg_temp%
)

cd %_root_drive%\

git clone -c core.symlinks=false --verbose --progress --recursive git@github.com:StarGate-One/vcpkg-tool.git %_vcpkg_tool%

cd %_vcpkg_tool%

git remote add upstream git@github.com:microsoft/vcpkg-tool.git

endlocal