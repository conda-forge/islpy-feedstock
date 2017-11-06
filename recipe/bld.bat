copy /y %RECIPE_DIR%\isl_declaration_macros_expanded.h .
python configure.py --no-use-shipped-isl --no-use-gmp --isl-inc-dir=%LIBRARY_INC% --isl-lib-dir=%LIBRARY_LIB%
python setup.py install --single-version-externally-managed --record record.txt
