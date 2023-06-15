#!/bin/bash

DOCX_FILE=$1

# Get script dir
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters" >&2
    echo "Usage: convert_word_to_quarto.sh <docx file>" >&2
    exit 2
fi

if [ ! -f "${DOCX_FILE}" ]; then
    echo "${DOCX_FILE} does not exist." >&2
    exit 3
fi

echo "Converting ${DOCX_FILE} to ${DOCX_FILE%.*}.qmd"

mammoth \
    "${DOCX_FILE}" \
    --style-map=${SCRIPT_DIR}/indicators-mammoth-style-map.txt \
| \
pandoc \
    -f html \
    -t gfm+backtick_code_blocks \
    -o "${DOCX_FILE%.*}.qmd"