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
        --atx-headers \
        -t markdown+backtick_code_blocks+header_attributes+space_in_atx_header-all_symbols_escapable-smart-simple_tables+pipe_tables \
        --lua-filter=${SCRIPT_DIR}/filter.lua \
        -o "${DOCX_FILE%.*}.qmd"

done