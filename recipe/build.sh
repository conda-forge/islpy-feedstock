python configure.py --no-use-shipped-isl --isl-inc-dir=$PREFIX/include --isl-lib-dir=$PREFIX/include
python setup.py install --single-version-externally-managed --record record.txt
