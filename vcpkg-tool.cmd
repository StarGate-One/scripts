@echo off
setlocal

set COPYCMD=/b /v /y
set _root_drive=D:
set _vcpkg_root=%_root_drive%\vcpkg
set _vcpkg_exe=%_vcpkg_root%\vcpkg.exe
set _vcpkg_metrics=%_vcpkg_root%\vcpkg.disable-metrics
set _vcpkg_tool=%_root_drive%\vcpkg-tool
set _vcpkg_tool_build=%_vcpkg_tool%\build
set _vcpkg_tool_source=%_vcpkg_tool%
set _vcpkg_tool_exe=%_vcpkg_tool%\build\Release\vcpkg.exe

call date-time.cmd

set _vcpkg-tool_latest_git-commit-date=EMPTY

set _vcpkg_git_format="--format=%%cd"
set _vcpkg_git_date_format="--date=iso-strict"

for /f "tokens=* USEBACKQ" %%g in (`git log -n 1 %_vcpkg_git_format% %_vcpkg_git_date_format%`) do (
	set _vcpkg-tool_latest_git-commit-date=%%g
	if %_vcpkg-tool_latest_git-commit-date% == "EMPTY" (
       set _vcpkg-tool_latest_git-commit-date=%file_current-date%
	)
)

%_root_drive%
cd %_root_drive%\

cd %_vcpkg_tool%

if exist %_vcpkg_tool_build% (
   rmdir /q /s %_vcpkg_tool_build%
   mkdir %_vcpkg_tool_build%
)

cmake -B %_vcpkg_tool_build% -S %_vcpkg_tool_source% -G "Visual Studio 16 2019" -A x64 -T v142 -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DVCPKG_DEVELOPMENT_WARNINGS=ON -DVCPKG_WARNINGS_AS_ERRORS=ON -DVCPKG_BUILD_FUZZING=OFF -DVCPKG_EMBED_GIT_SHA=ON -DVCPKG_ADD_SOURCELINK=ON -DVCPKG_BASE_VERSION=%_vcpkg-tool_latest_git-commit-date%

cmake --build %_vcpkg_tool_build% --target vcpkg --clean-first --verbose --config release --parallel 8

if exist %_vcpkg_tool_exe% (
   copy %_vcpkg_tool_exe% %_vcpkg_exe%
   cd %_vcpkg_root%
   %_vcpkg_exe% version
   if not exist %_vcpkg_metrics% (
      echo. >%_vcpkg_metrics%
   )
)

endlocal