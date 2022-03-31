@echo off
setlocal
set _root_drive=D:
set _vcpkg_root=%_root_drive%\vcpkg
set _vcpkg_ports=D:\Projects\Git\scripts\vcpkg-ports.txt
set _vcpkg_log=D:\Projects\Git\logs\vcpkg-ports.log

call vcpkg-env.cmd >nul

set >%_vcpkg_log%
echo. >>%_vcpkg_log%
echo. >>%_vcpkg_log%

@rem .\vcpkg.exe install --recurse --keep-going --dry-run "@%_vcpkg_ports%" >>%_vcpkg_log% 2>>&1
@rem .\vcpkg.exe install --recurse --keep-going --debug "@%_vcpkg_ports%" >>%_vcpkg_log% 2>>&1
@rem .\vcpkg.exe install --recurse --keep-going --head "@%_vcpkg_ports%" >>%_vcpkg_log% 2>>&1
@rem
.\vcpkg.exe install --recurse --keep-going --clean-after-build "@%_vcpkg_ports%" >>%_vcpkg_log% 2>>&1

endlocal