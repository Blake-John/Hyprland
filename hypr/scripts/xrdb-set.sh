#!/bin/bash
if [ -e ~/.config/.Xresources ]; then
	xrdb -merge ~/.config/.Xresources
else
	echo "Xft.dpi:120" | xrdb -merge
fi
