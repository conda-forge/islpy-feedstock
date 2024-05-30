echo on

sed -i "/LTO/d" CMakeLists.txt

%PYTHON% configure.py --no-use-shipped-isl --no-use-gmp --isl-inc-dir=%LIBRARY_INC% --isl-lib-dir=%LIBRARY_LIB%

%PYTHON% -m pip install . -vv
