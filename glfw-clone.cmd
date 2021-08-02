setlocal
D:
cd D:\Projects\Git\OpenGL
git clone -c core.symlinks=false --recurse-submodules --verbose git@github.com:glfw/glfw.git D:\Projects\Git\OpenGL\glfw
cd D:\Projects\Git\OpenGL\glfw
git submodule update --init --recursive
pause
endlocal