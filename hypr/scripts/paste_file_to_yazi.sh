#!/usr/bin/bash

dest=$1

if wl-paste -t image/png >/dev/null 2>&1; then
    filename="$(date +%Y%m%d-%H%M%S).png"
    wl-paste -t image/png >"$dest/$filename"
else
    files=$(wl-paste -t text/plain)
    # echo $files
    for f in ${files}; do
        # echo $f
        if [[ $f == file://* ]]; then
            filepath=$(echo $f | sed -E 's|^file://||')
            filename=$(basename $filepath)
            cp $filepath "$dest/$filename"
        elif [[ -e $f ]]; then
            filename=$(basename $f)
            cp $f "$dest/$filename"
        fi
    done
fi
