#!/usr/bin/bash

red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[36m"
end="\033[0m"

ranger_=(ranger atool less highlight python-pillow ffmpegthumbnailer catdoc docx2txt)
rofi_=(rofi-calc-git calc-git)
archive_=(zip unzip 7-zip)
editor_=(vim neovim zathura zathura-pdf-poppler)
utils_=(hyprpicker hyprlock swww mpvpaper grimblast-git swappy)

steps=("ranger" "rofi" "archive" "editor" "utils")

to_installs=()


echo "# ---------------------------------------------------------- #" >> $PWD/install.log
echo "# additional.sh - installing the additional packages " >> $PWD/install.log
echo "# ---------------------------------------------------------- #" >> $PWD/install.log
echo ""
echo -e "Now we are going to install the additional packages followed : "
echo ""
echo ${steps[@]}
echo ""
for i in ${steps[@]}; do
	echo -e "Do you want to install $blue$i$end ? ([y]/n)"
	read install_choice
	if [ -z $install_choice ] || [ $install_choice == "y" ]; then
		to_installs+=($i)
	fi
done


for step in ${!to_installs[@]}; do
	echo -e $yellow"Step $step : Installing the ${to_installs[$step]} ..."$end
	case ${to_installs[$step]} in
		("ranger")
			for element in ${ranger_[@]}; do
				echo ""
				echo "Start to install $element ..."
				sudo pacman -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;

		("rofi")
			for element in ${rofi_[@]}; do
				echo ""
				echo "Start to install $element ..."
				yay -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;
			
		("archive")
			for element in ${archive_[@]}; do
				echo ""
				echo "Start to install $element ..."
				sudo pacman -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;

		("editor")
			for element in ${editor_[@]}; do
				echo ""
				echo "Start to install $element ..."
				sudo pacman -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;

		("utils")
			for element in ${utils_[@]}; do
				echo ""
				echo "Start to install $element ..."
				yay -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;
	esac

	echo ""
done
