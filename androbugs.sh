#!/usr/bin/env bash
set -e
set -o pipefail

INPUT_PATH=${INPUT_PATH:-${INPUT_PATH}}
OUT=${OUT:-/tmp/result.json}

${PYTHON} androbugs.py \
  -f "${INPUT_PATH}"
  $@ > ${OUT}

RES=$?
case "${RES}" in
  0) cat ${OUT}
    ;;
  *) exit $RES
    ;;
esac
