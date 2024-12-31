#!/usr/bin/env bash

wallpaper=$(readlink "${HOME}/.current_wallpaper")

wal -i $wallpaper -s -t -n

theme_color=$(sed -n '2p' ~/.cache/wal/colors-rofi-dark.rasi | sed -E 's/active-background: (.*)\;/\1/')
echo $theme_color

# set the rofi style

sed -E "s/main-color:(.*?);/main-color:\t$theme_color""77;/" ~/.config/rofi/colors/rofi-light.rasi
sed -i -E "s/main-color:(.*?);/main-color:\t$theme_color""77;/" ~/.config/rofi/colors/rofi-light.rasi
sed -E "s/main-color:(.*?);/main-color:\t$theme_color""77;/" ~/.config/rofi/colors/rofi-dark.rasi
sed -i -E "s/main-color:(.*?);/main-color:\t$theme_color""77;/" ~/.config/rofi/colors/rofi-dark.rasi

# set the waybar style

sed -E "s/main-color(.*?);/main-color\t$theme_color;/" ~/.config/waybar/color-light.css
sed -i -E "s/main-color(.*?);/main-color\t$theme_color;/" ~/.config/waybar/color-light.css
sed -E "s/main-color(.*?);/main-color\t$theme_color;/" ~/.config/waybar/color-dark.css
sed -i -E "s/main-color(.*?);/main-color\t$theme_color;/" ~/.config/waybar/color-dark.css


pkill waybar
waybar > /dev/null 2>&1 &
