echo on

sed -i "/LTO/d" CMakeLists.txt
sed -i "/NOMINSIZE/d" CMakeLists.txt
sed -i "$ a target_compile_options(_isl PRIVATE /cgthreads1)" CMakeLists.txt

type CMakeLists.txt

set VERBOSE=1

%PYTHON% -m pip install . -vv ^
    --config-settings=cmake.define.USE_SHIPPED_ISL=OFF ^
    --config-settings=cmake.define.USE_SHIPPED_IMATH=OFF ^
    --config-settings=cmake.define.ISL_INC_DIRS:LIST=%LIBRARY_INC% \
    --config-settings=cmake.define.ISL_LIB_DIRS:LIST=%LIBRARY_LIB%
