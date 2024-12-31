#/usr/bin/bash

red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[36m"
end="\033[0m"

body=(hyprland-git waybar rofi-lbonn-wayland-git)
terminal=(fish kitty)
files=(dolphin ark ntfs-3g)
multimedias=(feh vlc mpv qmmp)
clipboard=(wl-clipboard cliphist)
policy=(polkit-kde-agent hyprpolkitagent)
devices=(brightnessctl bluez bluez-utils pipewire
	wireplumber pamixer pavucontrol networkmanager 
	xorg-xrdb neofetch btop power-profiles-daemon
	xorg-xwayland qt5-wayland qt6-wayland
)
input=(fcitx5 fcitx5-chinese-addons fcitx5-configtool 
	wqy-zenhei nerd-fonts noto-fonts noto-fonts-emoji
)

dm=(sddm gdm lightdm)

steps=("main_body" "terminal" "files" "multimedias" "clipboard" "policy" "devices" "input" "dm")

to_installs=()

echo "# ---------------------------------------------------------- #" > $PWD/install.log
echo "# main.sh - installing the main packages " >> $PWD/install.log
echo "# ---------------------------------------------------------- #" >> $PWD/install.log
echo ""
echo -e "Now we are going to install the main packages followed : "
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

if [[ ${to_installs[@]} =~ "dm" ]]; then
	echo ""
	echo "Here are the diskplay managers available : "
	echo ""
	echo ${dm[@]}
	echo ""
	echo "What do you want to install ? (default sddm)"
	read dm_choice
	if [ -z $dm_choice ]; then
		dm_choice=sddm
	fi
fi
	

echo ""
echo "The following packages will be installed : "
echo ""
echo ${to_installs[@]}
echo ""
read -p "continue ? ([yes]/no) " to_continue
if ! [ -z $to_continue ] && [ $to_continue != "yes" ]; then
	echo "exit install main packages"
fi

for step in ${!to_installs[@]}; do
	echo -e $yellow"Step $step : Installing the ${to_installs[$step]} ..."$end
	case ${to_installs[$step]} in
		("main_body")
			for element in ${body[@]}; do
				echo ""
				echo -e "Start to install $element ..."
				yay -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;

		("terminal")
			for element in ${terminal[@]}; do
				echo ""
				echo -e "Start to install $element ..."
				sudo pacman -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;

		("files")
			for element in ${files[@]}; do
				echo ""
				echo -e "Start to install $element ..."
				sudo pacman -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;

		("multimedias")
			for element in ${multimedias[@]}; do
				echo ""
				echo -e "Start to install $element ..."
				sudo pacman -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;

		("clipboard")
			for element in ${clipboard[@]}; do
				echo ""
				echo -e "Start to install $element ..."
				sudo pacman -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;

		("policy")
			for element in ${policy[@]}; do
				echo ""
				echo -e "Start to install $element ..."
				sudo pacman -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			;;

		("devices")
			for element in ${devices[@]}; do
				echo ""
				echo -e "Start to install $element ..."
				sudo pacman -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done
			sudo systemctl enable NetworkManager >> install.log 2>&1
			;;

		("input")
			for element in ${input[@]}; do
				echo ""
				echo -e "Start to install $element ..."
				sudo pacman -S --noconfirm --needed $element >> install.log 2>&1
				if [ !$1 ]; then
					echo -e $green"$element is installed successfully !"$end
				else
					echo -e $red"Failed to install $element !"$end
					echo -e $yellow"You can refer to the \`install.log\`"$end
				fi
			done

			echo -e "Start to install fictx5-input-support ..."
			yay -S --noconfirm --needed fictx5-input-support
			if [ !$1 ]; then
				echo -e $green"$element is installed successfully !"$end
			else
				echo -e $red"Failed to install $element !"$end
				echo -e $yellow"You can refer to the \`install.log\`"$end
			fi
			;;

		("dm")
			echo -e "Start to install $dm_choice ..."
			sudo pacman -S --noconfirm --needed $dm_choice >> install.log 2>&1
			if [ !$1 ]; then
				echo -e $green"$element is installed successfully !"$end
			else
				echo -e $red"Failed to install $element !"$end
				echo -e $yellow"You can refer to the \`install.log\`"$end
			fi
			sudo systemctl enable $dm_choice >> install.log 2>&1
			;;
	esac
	echo ""
done

echo "" >> $PWD/install.log
