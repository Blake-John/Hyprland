#!/usr/bin/env bash

pkill waybar
pkill swaync
pkill rofi

sleep 0.01
waybar > /dev/null 2>&1 &

sleep 0.01
swaync > /dev/null 2>&1 &
