@echo off
@setlocal

@set _SDL_DIR=D:\Projects\Git\SDL
@set _SDL2_DIR=%_SDL_DIR%\SDL2_sources
@set _SDL2_image_DIR=%_SDL2_DIR%\SDL2_image
@set _SDL2_mixer_DIR=%_SDL2_DIR%\SDL2_mixer
@set _SDL2_net_DIR=%_SDL2_DIR%\SDL2_net
@set _SDL2_rtf_DIR=%_SDL2_DIR%\SDL2_rtf
@set _SDL2_ttf_DIR=%_SDL2_DIR%\SDL2_ttf

D:

@if not exist %_SDL_DIR% (
	@mkdir %_SDL_DIR%
)

@cd %_SDL_DIR%

@if exist %_SDL2_DIR% (
	@rmdir /q /s %_SDL2_DIR%
)

@git clone -c core.symlinks=false --recurse-submodules --verbose git@github.com:libsdl-org/SDL.git %_SDL2_DIR%
@cd %_SDL2_DIR%
@git submodule update --init --recursive
@pause

@git clone -c core.symlinks=false --recurse-submodules --verbose git@github.com:libsdl-org/SDL_ttf.git %_SDL2_ttf_DIR%
@cd %_SDL2_ttf_DIR%
@git submodule update --init --recursive
@pause

@git clone -c core.symlinks=false --recurse-submodules --verbose git@github.com:libsdl-org/SDL_rtf.git %_SDL2_rtf_DIR%
@cd %_SDL2_rtf_DIR%
@git submodule update --init --recursive
@pause

@git clone -c core.symlinks=false --recurse-submodules --verbose git@github.com:libsdl-org/SDL_image.git %_SDL2_image_DIR%
@cd %_SDL2_image_DIR%
@git submodule update --init --recursive
@pause

@cd D:\Projects\Git\SDL\SDL2
@git clone -c core.symlinks=false --recurse-submodules --verbose git@github.com:libsdl-org/SDL_net.git %_SDL2_net_DIR%
@cd %_SDL2_net_DIR%
@git submodule update --init --recursive
@pause

@git clone -c core.symlinks=false --recurse-submodules --verbose git@github.com:libsdl-org/SDL_mixer.git %_SDL2_mixer_DIR%
@cd %_SDL2_mixer_DIR%
@git submodule update --init --recursive
@pause

@endlocal