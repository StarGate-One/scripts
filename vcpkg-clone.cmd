@echo off
setlocal

set COPYCMD=/b /v /y
set _root_drive=D:
set _vcpkg_root=%_root_drive%\vcpkg
set _vcpkg_exe=%_vcpkg_root%\vcpkg.exe
set _vcpkg_metrics=%_vcpkg_root%\vcpkg.disable-metrics
set _vcpkg_temp=%_vcpkg_root%\temp
set _vcpkg_tool=%_vcpkg_root%\vcpkg-tool
set _vcpkg_tool_build=%_vcpkg_tool%\build
set _vcpkg_tool_source=%_vcpkg_tool%
set _vcpkg_tool_exe=%_vcpkg_tool%\build\Release\vcpkg.exe

%_root_drive%
cd %_root_drive%\

if exist %_vcpkg_root% (
	rmdir /q /s %_vcpkg_root%
)

rem git clone -c core.symlinks=false --verbose --progress --recursive git@github.com:microsoft/vcpkg.git %_vcpkg_root%
git clone -c core.symlinks=false --verbose --progress --recursive git@github.com:StarGate-One/vcpkg.git %_vcpkg_root%

cd %_vcpkg_root%
git submodule update --init --recursive

git remote add upstream git@github.com:microsoft/vcpkg.git

if not exist %_vcpkg_metrics% (
	echo. >%_vcpkg_metrics%
)

rem git clone -c core.symlinks=false --verbose --progress --recursive git@github.com:microsoft/vcpkg-tool.git %_vcpkg_tool%
git clone -c core.symlinks=false --verbose --progress --recursive git@github.com:StarGate-One/vcpkg-tool.git %_vcpkg_tool%

cd %_vcpkg_tool%
git submodule update --init --recursive

git remote add upstream git@github.com:microsoft/vcpkg-tool.git

cmake -B %_vcpkg_tool_build% -S %_vcpkg_tool_source% -G "Visual Studio 16 2019" -A x64 -T v142 -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DVCPKG_DEVELOPMENT_WARNINGS=ON -DVCPKG_WARNINGS_AS_ERRORS=ON -DVCPKG_BUILD_FUZZING=OFF -DVCPKG_EMBED_GIT_SHA=ON -DVCPKG_ADD_SOURCELINK=ON

cmake --build %_vcpkg_tool_build% --target vcpkg --clean-first --verbose --config release --parallel 8

if exist %_vcpkg_tool_exe% (
	copy %_vcpkg_tool_exe% %_vcpkg_exe%
	cd %_vcpkg_root%
	%_vcpkg_exe% version
)

cd %_vcpkg_root%
rem git submodule add git@github.com:microsoft/vcpkg-tool.git %_vcpkg_tool%
git submodule add git@github.com:StarGate-One/vcpkg-tool.git %_vcpkg_tool%

if not exist %_vcpkg_temp% (
	mkdir %_vcpkg_temp%
)

endlocal