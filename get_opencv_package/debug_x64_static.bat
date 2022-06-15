set build_type=Debug
set build_arch=x64
set build_dir=./%build_type%_%build_arch%_static

cmake -G"Visual Studio 15 2017" -A %build_arch% ^
	-DBUILD_opencv_wechat_qrcode=OFF ^
	-DBUILD_SHARED_LIBS:BOOL=OFF ^
	-DBUILD_TESTS:BOOL=OFF ^
	-DBUILD_PERF_TESTS:BOOL=OFF ^
	-DBUILD_EXAMPLES:BOOL=OFF ^
	-DBUILD_DOCS:BOOL=OFF ^
	-DBUILD_opencv_python2:BOOL=OFF ^
	-DBUILD_opencv_python3:BOOL=OFF ^
	-DWITH_CUDA:BOOL=OFF ^
	-DOPENCV_IO_FORCE_OPENEXR=1 ^
	-DOPENCV_SKIP_PYTHON_WARNING:BOOL=ON ^
	-DOPENCV_EXTRA_MODULES_PATH="../opencv_contrib/modules" ^
	-DCMAKE_INSTALL_PREFIX="./opencv/%build_arch%" ^
	-B"%build_dir%" ^
	..

cmake --build %build_dir%  --target install --config %build_type% -j 14 --

pause
