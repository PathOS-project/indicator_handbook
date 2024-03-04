#!/bin/bash

# Get script dir
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for DOCX_FILE in "$@"
do

    if [ ! -f "${DOCX_FILE}" ]; then
        echo "${DOCX_FILE} does not exist." >&2
        exit 3
    fi

    DIR_DOCX="${DOCX_FILE%/*}"
    DOCX_BASE="${DOCX_FILE##*/}"

    pushd "${DIR_DOCX}"

    echo "Converting ${DOCX_BASE} to ${DOCX_BASE%.*}.qmd"

    mammoth \
        "${DOCX_BASE}" \
        --style-map=${SCRIPT_DIR}/indicators-mammoth-style-map.txt \
    | \
    pandoc \
        -f html \
        --extract-media "figures" \
        --markdown-headings=atx \
        --wrap=preserve \
        -t markdown+backtick_code_blocks+header_attributes+space_in_atx_header-all_symbols_escapable-smart-simple_tables+pipe_tables \
        --lua-filter=${SCRIPT_DIR}/filter.lua \
        -o "${DOCX_BASE%.*}.qmd"

    popd
done