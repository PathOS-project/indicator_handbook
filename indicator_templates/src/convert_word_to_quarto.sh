mammoth \
    --style-map=indicators-mammoth-style-map.txt \
    --output-dir "html" \
    "Open Access uptake.docx"

pandoc \
    -f html \
    -t gfm+backtick_code_blocks \
    -o "md/Open Access uptake.md" \
    "html/Open Access uptake.html"
