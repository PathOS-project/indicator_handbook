#!/usr/bin/gawk -f

BEGIN {out="000-unnamed.md"
    stderr="/dev/fd/2"}
/^##\ / {name=substr($0, 4)
    out=tolower(gensub(/[\\/#% [:space:] ]/, "-", "g", name))".md"
    }
{print >out}