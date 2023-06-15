#!/bin/bash

# Get script dir
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for DOCX_FILE in "$@"
do

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

done