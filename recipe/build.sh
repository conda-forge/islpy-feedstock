if [[ "${with_barvinok}" == "1" ]]; then
  EXTRA_CONFIGURE_OPTIONS="--use-barvinok"
fi

"${PYTHON}" configure.py \
  --no-use-shipped-isl \
  --no-use-gmp \
  --isl-inc-dir="$PREFIX/include" \
  --isl-lib-dir="$PREFIX/include" \
  $EXTRA_CONFIGURE_OPTIONS

"${PYTHON}" -m pip install . -vv
