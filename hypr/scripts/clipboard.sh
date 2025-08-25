#!/usr/bin/bash

result=$(cliphist list | rofi -dmenu)

if [[ $result == *file://* ]]; then
    decoded=$(cliphist decode $result)
    files=()
    for f in ${decoded}; do
        file=$(echo $f | sed -E 's|^.*file://||')
        files+=($file)
    done
    echo ${files[*]} | wl-copy
    ripdrag ${files[*]} -x -a
else
    cliphist decode $result | wl-copy
fi
