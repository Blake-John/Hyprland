#!/usr/bin/bash

# Wallpapers Path
wallpaperDir="${HOME}/.config/wallpapers/"
themes="${HOME}/.config/rofi/wallpaperSelect/wallpaper-select.rasi"

# Transition config
FPS=40
TYPE="any"
DURATION=2
BEZIER="0.6,0.08,1.0,0.55"
SWWW_PARAMS="--transition-fps ${FPS} --transition-type ${TYPE} --transition-duration ${DURATION} --transition-bezier ${BEZIER}"

# Retrieve image files as a list
PICS=($(find "${wallpaperDir}" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \)))

# Use date variable to increase randomness
randomNumber=$((($(date +%s) + RANDOM) + $$))
randomPicture="${PICS[$((randomNumber % ${#PICS[@]}))]}"
randomChoice="[${#PICS[@]}] Random"

# Rofi command
rofiCommand="rofi -show -dmenu -theme $themes"

# Execute command according the wallpaper manager
executeCommand() {

    if command -v swww &>/dev/null; then
        if [[ -z $($1 | grep .gif$) ]]; then
            swww img "$1" ${SWWW_PARAMS}
        else
            swww img $1
        fi

    elif command -v swaybg &>/dev/null; then
        swaybg -i "$1" &

    else
        echo "Neither swww nor swaybg are installed."
        exit 1
    fi

    ln -sf "$1" "$HOME/.current_wallpaper"
}

# Show the images
menu() {

    printf "$randomChoice\0icon\x1f<span> </span>\n"

    for i in "${!PICS[@]}"; do

        # If not *.gif, display
        if [[ -z $(echo "${PICS[$i]}" | grep .gif$) ]]; then
            # printf "$(basename "${PICS[$i]}" | cut -d. -f1)\x00icon\x1f${PICS[$i]}\n"
            printf "$(basename "${PICS[$i]}" | cut -d. -f1)\x00icon\x1f${PICS[$i]}\n"
        else
            # Displaying .gif to indicate animated images
            # printf "$(basename "${PICS[$i]}")\n"
            printf "$(basename "${PICS[$i]}")\x00icon\x1f${PICS[$i]}\n"
            # printf "$(basename "${PICS[$i]}" | cut -d. -f1)\x00icon\x1f${PICS[$i]}\n"
        fi
    done
}

# If swww exists, start it
if command -v swww &>/dev/null; then
    swww query || swww init
fi

# Execution
main() {
    choice=$(menu | ${rofiCommand})

    # No choice case
    if [[ -z $choice ]]; then
        exit 0
    fi

    # Random choice case
    if [ "$choice" = "$randomChoice" ]; then
        executeCommand "${randomPicture}"
        return 0
    fi

    # Find the selected file
    for file in "${PICS[@]}"; do
        # Getting the file
        if [[ "$(basename "$file" | cut -d. -f1)" = "$choice" ]]; then
            selectedFile="$file"
            break
        elif [[ "$(basename "$file")" = "$choice" ]]; then
            selectedFile="$file"
            break
        fi
    done

    # Check the file and execute
    if [[ -n "$selectedFile" ]]; then
        executeCommand "${selectedFile}"
        return 0
    else
        echo "Image not found."
        exit 1
    fi

}

# Check if rofi is already running
if pidof rofi >/dev/null; then
    pkill rofi
    exit 0
fi

main

# Sleep to work properly
sleep 0.01
~/.config/hypr/scripts/pywal.sh
# sleep 0.2
# ./refresh.sh
