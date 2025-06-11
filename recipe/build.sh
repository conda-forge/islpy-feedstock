#!/bin/bash

set -ex
EXTRA_PIP_INSTALL_FLAGS=""

if [[ "${with_barvinok}" == "True" ]]; then
  EXTRA_PIP_INSTALL_FLAGS="--config-settings=cmake.define.USE_BARVINOK=ON $EXTRA_PIP_INSTALL_FLAGS"
fi

# Generating the stubs seems near-impossible in a cross-copmilation situation, since
# stub generation needs to import the built binary in order to work. Instead, we're
# grabbing the stubs from a binary wheel on the package index here.
if [[ "$CONDA_BUILD_CROSS_COMPILATION" == 1 ]]; then
  EXTRA_PIP_INSTALL_FLAGS="--config-settings=cmake.define=GENERATE_STUBS=OFF $EXTRA_PIP_INSTALL_FLAGS"
  pip download "islpy==$PKG_VERSION" --only-binary :all:
  unzip *.whl islpy/_isl.pyi 
fi

# Finagle libxcrypt headers into build
echo "include_directories($PREFIX/include)" >> CMakeLists.txt

export VERBOSE=1

"${PYTHON}" -m pip install . -vv \
    --config-settings=cmake.define.USE_SHIPPED_ISL=OFF \
    --config-settings=cmake.define.USE_SHIPPED_IMATH=OFF \
    --config-settings=cmake.define.ISL_INC_DIRS:LIST="$PREFIX/include " \
    --config-settings=cmake.define.ISL_LIB_DIRS:LIST="$PREFIX/lib" \
    $EXTRA_PIP_INSTALL_FLAGS

