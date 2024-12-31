#!/bin/bash
#
theme=~/.config/rofi/todo/style.rasi

rofi -modi TODO:$HOME/.config/rofi/todo/list.sh_ -show TODO -theme $theme

exit 0
