#!/usr/bin/bash

red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[36m"
end="\033[0m"

echo " _       __     __                             __      "
echo "| |     / /__  / /________  ____ ___  ___     / /_____ "
echo "| | /| / / _ \/ / ___/ __ \/ __ \`__ \/ _ \   / __/ __ \\"
echo "| |/ |/ /  __/ / /__/ /_/ / / / / / /  __/  / /_/ /_/ /"
echo "|__/|__/\___/_/\___/\____/_/ /_/ /_/\___/   \__/\____/ "
echo "                                                       "
echo "    __  __                 __                __   __	"
echo "   / / / /_  ______  _____/ /___ _____  ____/ /  / /	"
echo "  / /_/ / / / / __ \/ ___/ / __ \`/ __ \/ __  /  / / 	"
echo " / __  / /_/ / /_/ / /  / / /_/ / / / / /_/ /  /_/  	"
echo "/_/ /_/\__, / .___/_/  /_/\__,_/_/ /_/\__,_/  (_)   	"
echo "      /____/_/                                      	"
echo ""

echo "Now, we are going to install the Hyprland, continue ? ([yes]/no)"
read continue_
if ! [ -z $continue_ ] && [ "$continue_" != "yes" ] ; then
	echo "Exit Installation !"
	exit
fi

echo "The Installation is divided into 3 stages : "
echo ""
echo "0. Install the must have utils"
echo "1. Install the additional utils"
echo "2. Copy the config files"
echo ""

echo -e $blue"Stage 0 : Install the main packages"$end
echo ""
./install_scripts/main.sh
echo -e $green"Stage 0 finished !"$end
echo""

echo -e $blue"Stage 1 : Install the additional utils"$end
echo ""
./install_scripts/additional.sh
echo -e $green"Stage 1 finished !"$end
echo ""

echo -e $blue"Stage 2 : Copy the config files"$end
echo -e "Do you want to copy the config files ? ([yes]/no)"
read copy_files
if [ -z $copy_files ] || [ $copy_files == "yes" ]; then
	cp -r ./fish/ ./gtk-3.0/ ./gtk-4.0/ ./hypr/ ./kitty/ ./neofetch/ ./nvim/ ./ranger/ ./rofi/\
		./swaync/ ./wallpapers/ ./waybar/ ./xsettingsd/ ./.Xresources ~/.config/
	cp -r ./fonts/* ~/.local/share/fonts/
	echo -e $green"Stage 2 finished !"$end
else
	echo -e $yellow"You can copy the config files by yourself !"
fi
echo""
echo -e $green"Installation Finished !"$end
echo -e $green"Have a good time with Hyprland !"$end

read -p "Reboot Now ? ([yes]/no) " to_reboot
if [ -z $to_reboot ] || [ $to_reboot == "yes" ]; then
	reboot
fi
