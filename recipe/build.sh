#!/bin/bash

set -x

if [[ $ENABLE_BARVINOK -eq 1 ]]; then
    echo "Building with Barvinok support"
    EXTRA_ARGS="--use-barvinok --no-use-shipped-imath"
fi

python configure.py --no-use-shipped-isl --no-use-gmp --isl-inc-dir=$PREFIX/include --isl-lib-dir=$PREFIX/include $EXTRA_ARGS

python setup.py install --single-version-externally-managed --record record.txt
