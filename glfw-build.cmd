setlocal
D:
cd D:\Projects\Git\OpenGL\glfw

if exist .\build.rel (
	rmdir /q /s .\build.rel
	mkdir .\build.rel
)

rem if exist .\install.rel (
rem	rmdir /q /s .\install.rel
rem	mkdir .\install.rel
rem )

cd .\build.rel
cmake -S ..\ -B .\ -G "Visual Studio 16 2019" -A x64 -T v142 -DCMAKE_INSTALL_PREFIX:PATH=D:\Git\OpenGL\glfw\install.rel -DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_EXAMPLES=OFF -DGLFW_BUILD_TESTS=OFF -DGLFW_BUILD_DOCS=OFF -DCMAKE_VERBOSE_MAKEFILE=TRUE

rem cmake --build . --target install --clean-first --verbose --config release --parallel 8 
cmake --build . --clean-first --verbose --config release --parallel 8 

cd D:\Projects\Git\OpenGL\glfw

if exist .\build.dbg (
	rmdir /q /s .\build.dbg
	mkdir .\build.dbg
)

rem if exist .\install.dbg (
rem	rmdir /q /s .\install.dbg
rem	mkdir .\install.dbg
rem )

cd .\build.dbg
cmake -S ..\ -B .\ -G "Visual Studio 16 2019" -A x64 -T v142 -DCMAKE_INSTALL_PREFIX:PATH=D:\Git\OpenGL\glfw\install.dbg -DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_EXAMPLES=OFF -DGLFW_BUILD_TESTS=OFF -DGLFW_BUILD_DOCS=OFF -DCMAKE_VERBOSE_MAKEFILE=TRUE

rem cmake --build . --target install --clean-first --verbose --config debug --parallel 8 
cmake --build . --clean-first --verbose --config debug --parallel 8 



pause
endlocal