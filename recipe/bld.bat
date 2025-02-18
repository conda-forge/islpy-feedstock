echo on

sed -i "/LTO/d" CMakeLists.txt
sed -i "/NOMINSIZE/d" CMakeLists.txt

%PYTHON% configure.py --no-use-shipped-isl --no-use-gmp --isl-inc-dir=%LIBRARY_INC% --isl-lib-dir=%LIBRARY_LIB%


sed -i "$ a target_compile_options(_isl PRIVATE /cgthreads1)" CMakeLists.txt

type CMakeLists.txt

set VERBOSE=1

%PYTHON% -m pip install . -vv
