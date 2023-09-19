@echo on

echo #include ^<string.h^> >> src\wrapper\wrap_isl.hpp
type src\wrapper\wrap_isl.hpp

%PYTHON% configure.py --no-use-shipped-isl --no-use-gmp --isl-inc-dir=%LIBRARY_INC% --isl-lib-dir=%LIBRARY_LIB%
%PYTHON% -m pip install . -vv
