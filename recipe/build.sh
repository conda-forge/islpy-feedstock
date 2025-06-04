#!/bin/bash

set -ex

if [[ "${with_barvinok}" == "True" ]]; then
  EXTRA_PIP_INSTALL_FLAGS="--config-settings=cmake.define.USE_BARVINOK=ON"
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

"${PYTHON}" -m pip install . -vv \
    --config-settings=cmake.define.USE_SHIPPED_ISL=OFF \
    --config-settings=cmake.define.USE_SHIPPED_IMATH=OFF \
    --config-settings=cmake.define.ISL_INC_DIRS:LIST="$PREFIX/include " \
    --config-settings=cmake.define.ISL_LIB_DIRS:LIST="$PREFIX/lib" \
    $EXTRA_PIP_INSTALL_FLAGS

