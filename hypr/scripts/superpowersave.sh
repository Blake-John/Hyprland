#!/usr/bin/bash

IS_SUPERPOWERSAVE=$(grep "export SUPERPOWERSAVE=." ~/.config/fish/config.fish | sed -E "s/export SUPERPOWERSAVE=(.)/\1/" )

if [[ $IS_SUPERPOWERSAVE == "0" ]]; then
	echo $IS_SUPERPOWERSAVE
	echo "Turn power save on"
	nmcli radio wifi off
	nmcli networking off
	bluetoothctl power off
	killall swaync
	~/.config/hypr/scripts/gamemode.sh
	pkill waybar
	sed -E -i "s/export SUPERPOWERSAVE=./export SUPERPOWERSAVE=1/" ~/.config/fish/config.fish
else
	echo $IS_SUPERPOWERSAVE
	echo "Turn power save off"
	nmcli networking on
	nmcli radio wifi on
	~/.config/hypr/scripts/gamemode.sh
	# waybar > /dev/null 2>&1 &
	sed -E -i "s/export SUPERPOWERSAVE=./export SUPERPOWERSAVE=0/" ~/.config/fish/config.fish
fi
