#!/bin/bash

set -x

$PYTHON -m pip install pcpp

python configure.py --no-use-shipped-isl --no-use-gmp --isl-inc-dir=$PREFIX/include --isl-lib-dir=$PREFIX/include --use-barvinok --no-use-shipped-imath

python setup.py install --single-version-externally-managed --record record.txt
