#! /usr/bin/env bash

theme=~/.config/rofi/calc/style.rasi

rofi -show calc -modi calc -theme ~/.config/rofi/calc/style.rasi -no-show-match -no-sort -calc-command "echo -n '{result}' | wl-copy"
