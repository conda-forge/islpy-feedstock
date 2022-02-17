{{ PYTHON }} configure.py --no-use-shipped-isl --no-use-gmp --isl-inc-dir=$PREFIX/include --isl-lib-dir=$PREFIX/include
{{ PYTHON }} -m pip install . -vv
