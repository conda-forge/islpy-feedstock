#!/bin/bash

set -ex

if [[ "${with_barvinok}" == "True" ]]; then
  EXTRA_CONFIGURE_OPTIONS="--use-barvinok --no-use-shipped-imath"
fi

"${PYTHON}" configure.py \
  --no-use-shipped-isl \
  --no-use-gmp \
  --isl-inc-dir="$PREFIX/include" \
  --isl-lib-dir="$PREFIX/lib" \
  $EXTRA_CONFIGURE_OPTIONS

# Finagle libxcrypt headers into build
echo "include_directories($PREFIX/include)" >> CMakeLists.txt

export VERBOSE=1

"${PYTHON}" -m pip install . -vv
