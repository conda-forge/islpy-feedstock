echo on

sed -i "/LTO/d" CMakeLists.txt

%PYTHON% configure.py --no-use-shipped-isl --no-use-gmp --isl-inc-dir=%LIBRARY_INC% --isl-lib-dir=%LIBRARY_LIB%


sed -i "$ a add_compile_options(/cgthreads1)" CMakeLists.txt

type CMakeLists.txt

set VERBOSE=1

%PYTHON% -m pip install . -vv
