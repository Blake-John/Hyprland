#!/usr/bin/env bash

if command -v waybar > /dev/null ; then
	if [ -z $(pgrep waybar) ]; then
		echo "Waybar not on"
		waybar > /dev/null 2>&1 &
	else
		echo "Waybar on"
		pkill waybar
	fi
fi
