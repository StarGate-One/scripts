@echo off
@setlocal

@set COPYCMD=/b /v /y
@set _root_drive=D:
@set _vcpkg_root=%_root_drive%\vcpkg
@set _vcpkg_exe=%_vcpkg_root%\vcpkg.exe
@set _vcpkg_metrics=%_vcpkg_root%\vcpkg.disable-metrics
@set _vcpkg_tool=%_root_drive%\vcpkg-tool
@rem set _vcpkg_tool_azure=%_vcpkg_tool%\azure-pipelines
@set _vcpkg_tool_build=%_vcpkg_tool%\build
@set _vcpkg_tool_source=%_vcpkg_tool%
@set _vcpkg_tool_exe=%_vcpkg_tool%\build\Release\vcpkg.exe

@call date-time.cmd

@rem set _vcpkg-tool_ce_sha=EMPTY
@set _vcpkg-tool_latest_tag-refname-date=EMPTY

@set _vcpkg_git_format="--format=%%cd"
@set _vcpkg_git_date_format="--date=format-local:%%Y-%%m-%%d"
@set TZ=UTC

@%_root_drive%
@cd %_root_drive%\

@cd %_vcpkg_tool%

@rem set _vcpkg-tool_ce_sha equal to sha info in file located in ./azure-pipelines
@rem for /f "tokens=* USEBACKQ" %%g in ("%_vcpkg_tool_azure%\vcpkg-ce-sha.txt") do (
     @rem set _vcpkg-tool_ce_sha=%%g
     @rem if %_vcpkg-tool_ce_sha% NEQ "EMPTY" (
         @rem goto next1
rem      )
rem )

:next1
@rem get date of last commit in CCYY-MM-DD format UTC Timezone
@for /f "tokens=* USEBACKQ" %%g in (`git show --quiet HEAD %_vcpkg_git_format% %_vcpkg_git_date_format%`) do (
     @set _vcpkg-tool_latest_tag-refname-date=%%g
)

@rem get all tags and sort in reverse commit date order
@rem for /f "tokens=* USEBACKQ" %%g in (`git tag --sort=-committerdate`) do (
     @rem set _vcpkg-tool_latest_tag-refname-date=%%g
     @rem if %_vcpkg-tool_latest_tag-refname-date% NEQ "EMPTY" (
         @rem goto next2
     @rem ) 
@rem )

:next2
@rem set to a legal date format if not done above 
@if %_vcpkg-tool_latest_tag-refname-date% == "EMPTY" (
    @set _vcpkg-tool_latest_tag-refname-date=%file_current-date%
)

@if exist %_vcpkg_tool_build% (
    @rmdir /q /s %_vcpkg_tool_build%
    @mkdir %_vcpkg_tool_build%
)

rem Build the vcpkg.exe source code
cmake -B %_vcpkg_tool_build% -S %_vcpkg_tool_source% -G "Visual Studio 17 2022" -A x64 -T v143 -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DVCPKG_DEVELOPMENT_WARNINGS=ON -DVCPKG_WARNINGS_AS_ERRORS=ON -DVCPKG_BUILD_FUZZING=OFF -DVCPKG_BUILD_TLS12_DOWNLOADER=OFF -DVCPKG_EMBED_GIT_SHA=ON -DVCPKG_OFFICIAL_BUILD=OFF -DFETCHCONTENT_FULLY_DISCONNECTED=OFF -DVCPKG_ADD_SOURCELINK=OFF -DVCPKG_BASE_VERSION=%_vcpkg-tool_latest_tag-refname-date% -DVCPKG_VERSION=%_vcpkg-tool_latest_tag-refname-date%

rem Compile/Link vcpkg.exe
cmake --build %_vcpkg_tool_build% --target vcpkg --clean-first --verbose --config release --parallel 8

@if exist %_vcpkg_tool_exe% (
    @copy %_vcpkg_tool_exe% %_vcpkg_exe%
    @cd %_vcpkg_root%
    %_vcpkg_exe% version
    @if not exist %_vcpkg_metrics% (
        @echo. >%_vcpkg_metrics%
    )
)

:end
@endlocal