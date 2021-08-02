@echo off
@setlocal

@set _SDL_DIR=D:\Projects\Git\SDL
@set _SDL2_DIR=%_SDL_DIR%\SDL2_sources
@set _SDL2_BUILD_DIR=%_SDL_DIR%\SDL2_build
@set _SDL2_SOURCE_DIR=%_SDL2_DIR%
@set _SDL2_INSTALL_DIR=%_SDL_DIR%\SDL2\external

@set _SDL2_image_DIR=%_SDL2_DIR%\SDL2_image
@set _SDL2_mixer_DIR=%_SDL2_DIR%\SDL2_mixer
@set _SDL2_net_DIR=%_SDL2_DIR%\SDL2_net
@set _SDL2_rtf_DIR=%_SDL2_DIR%\SDL2_rtf
@set _SDL2_ttf_DIR=%_SDL2_DIR%\SDL2_ttf

D:

@if not exist %_SDL2_DIR% (
	@echo %_SDL2_DIR% does not exist
	@echo exiting
	@goto end
)

@if exist %_SDL2_BUILD_DIR% (
	@rmdir /q /s  %_SDL2_BUILD_DIR%
)

@if exist %_SDL2_INSTALL_DIR% (
	@rmdir /q /s  %_SDL2_INSTALL_DIR%
)

@if not exist %_SDL2_INSTALL_DIR% (
	@mkdir %_SDL2_INSTALL_DIR%
)

:: SDL2 Main Software
@cd %_SDL2_DIR%

@cmake -G "Visual Studio 16 2019" -B %_SDL2_BUILD_DIR% -S %_SDL2_SOURCE_DIR% -A x64 -T v142 -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=%_SDL2_INSTALL_DIR%

@cd %_SDL2_BUILD_DIR%

cmake --build . --target ALL_BUILD INSTALL --clean-first --verbose --config debug --parallel 8

@cd %_SDL2_DIR%

@cmake -G "Visual Studio 16 2019" -B %_SDL2_BUILD_DIR% -S %_SDL2_SOURCE_DIR% -A x64 -T v142 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%_SDL2_INSTALL_DIR%

@cd %_SDL2_BUILD_DIR%

cmake --build . --target ALL_BUILD INSTALL --clean-first --verbose --config release --parallel 8

:: SDL2 








:end
@endlocal