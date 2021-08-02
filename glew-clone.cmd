setlocal
D:
cd D:\Projects\Git\OpenGL
git clone -c core.symlinks=false --recurse-submodules --verbose git@github.com:nigels-com/glew.git D:\Projects\Git\OpenGL\glew
cd D:\Projects\Git\OpenGL\glew
git submodule update --init --recursive
pause
endlocal