
DOCX_FILE="$1"

DIR_DOCX="${DOCX_FILE%/*}"
DOCX_BASE="${DOCX_FILE##*/}"

# Get script dir
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Converting ${DOCX_FILE} to ${DOCX_BASE%.*}.qmd"

../indicator_templates/src/convert_word_to_quarto.sh ${DOCX_FILE}

echo "Splitting ${DOCX_BASE%.*}.qmd"
pushd "${DIR_DOCX}"

${SCRIPT_DIR}/split.awk "${DOCX_BASE%.*}.qmd"

popd

# csplit --prefix="${DIR_DOCX}/Chapter-" \
    #    --suffix-format="%03d.md" \
    #    --silent \
    #    "${DIR_DOCX}/${DOCX_BASE%.*}.qmd" \
    #    /^##\ / {*}
