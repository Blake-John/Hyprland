#!/usr/bin/bash

# Wallpaper Path
wallpaperDir="${HOME}/.config/wallpapers/"
themes="${HOME}/.config/rofi/wallpaperSelect/wallpaper-select.rasi"
# themes="${HOME}/.config/rofi_/selector.rasi"

# Transition config
FPS=40
TYPE="any"
DURATION=2
BEZIER="0.6,0.08,1.0,0.55"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"
ROFI_COMMAND="rofi -dmenu -theme $themes -p Wallpaper: "

# Init the random vars
target_list=($(find $wallpaperDir -maxdepth 1 -mindepth 1))
target=$wallpaperDir
randomNum=0
randomChoice=none
randomChoiceShow=none
returnShow="Return Former"
toshow=none

#######################################
# show the wallpapers
#######################################
show_menu ()
{
	printf "$randomChoiceShow\0icon\x1f<span>    </span>\n"
	printf "$returnShow\0icon\x1f<span>  󰌑  </span>\n"
	
	for i in ${!target_list[@]}; do
		if [[ -d "${target_list[$i]}" ]]; then
			printf "$i.$(basename "${target_list[$i]}")\0icon\x1f<span>    </span>  \n"
		elif [[ -n $(echo ${target_list[$i]} | grep .mp4$) ]]; then
			toshow="$(dirname ${target_list[$i]})/$(basename ${target_list[$i]} | cut -d . -f 1).png"
			printf "$i.$(basename -a ${target_list[$i]})\0icon\x1f$toshow\n"
		else
			printf "$i.$(basename -a ${target_list[$i]} | cut -d . -f 1)\0icon\x1f${target_list[$i]}\n"
		fi
	done
}

main ()
{
	while [[ 1 ]]; do
		randomNum=$(($RANDOM + $$)) # RANDOM return a random number , $$ return the PID of the process
		randomChoice="${target_list[$(( $randomNum % ${#target_list[@]} ))]}"
		randomChoiceShow="[${#target_list[@]}] Random"
		choice=$(show_menu | $ROFI_COMMAND)

		# no choice
		if [[ -z $choice ]];then
			exit 0
		fi
	
		# random choice
		if [[ "$choice" = "$randomChoiceShow" ]]; then
			for i in ${!target_list[@]}; do
				if [[ $randomChoice = ${target_list[$i]} ]]; then
					index=$i
					target=$randomChoice
				fi
			done
		# return former
		elif [[ $choice = $returnShow ]]; then
			if [[ "$(basename $target)" = "wallpapers" ]]; then
				continue
			fi
			target=$(dirname $target)
			target_list=($(find "$target" -maxdepth 1 -mindepth 1))
			continue
		# normal choice
		else
			index=$(echo $choice | cut -d . -f 1)
			target=${target_list[$index]}
		fi

		# if choose a dir then turn into
		if [[ -d $target ]]; then
			if [[ "$(basename $target)" = "动态" ]]; then
				target_list=()
				target_list=($(find "$target" -maxdepth 1 -mindepth 1 -iname *.mp4))
			else
				target_list=()
				target_list=($(find "$target" -maxdepth 1 -mindepth 1))
			fi
		# if choose a mp4 then apply mpvpaper
		elif [[ $(echo $target | grep .mp4) ]]; then
			if command -v mpvpaper &>/dev/null; then
				swww kill
				pkill mpvpaper
				mpvpaper eDP-1 $target -o loop > /dev/null 2>&1 & 
				toshow="$(dirname ${target_list[$index]})/$(basename ${target_list[$index]} | cut -d . -f 1).png"
				ln -sf "$toshow" "${HOME}/.current_wallpaper" 
				echo $toshow
				~/.config/hypr/scripts/pywal.sh
				exit 0
			else
				exit 0
			fi
		# if choose a image then apply swww
		else
			if command -v swww-daemon &>/dev/null; then
				pkill mpvpaper
				swww-daemon > /dev/null 2>&1 &
				sleep 0.5
				swww img "$target" $SWWW_PARAMS > /dev/null 2>&1 &
				ln -sf "$target" "${HOME}/.current_wallpaper"
				~/.config/hypr/scripts/pywal.sh
				exit 0
			else
				exit 0
			fi
		fi
	done
}

main
