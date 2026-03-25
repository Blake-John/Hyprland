#!/usr/bin/bash

target_wallpaper=$1
name=$(basename $target_wallpaper)

## test the file exist

if [[ -e $target_wallpaper ]]; then
    echo "file exist: $target_wallpaper"
else
    echo "not a file: $target_wallpaper"
    exit 1
fi

## set the wallpaper by different type of input

if [[ $target_wallpaper == *.png || $target_wallpaper == *.jpg || $target_wallpaper == *.jpeg || $target_wallpaper == *.gif ]]; then
    echo "normal picture"
    if ! command -v awww >/dev/null 2>&1; then
        notify-send "awww does not exist, installing ..."
        sudo pacman -S awww
    fi
    awww img -t any --transition-bezier 0.0,0.0,1.0,1.0 --transition-duration 1 --transition-step 255 --transition-fps 60 "$target_wallpaper" &

elif [[ $target_wallpaper == *.mp4 ]]; then
    echo "mp4 video"
    if ! command -v mpvpaper >/dev/null 2>&1; then
        echo "mpvpaper not exist"
        notify-send "mpvpaper not exist, installing ..."
        paru -S mpvpaper
    fi

    ### stop previous and start next

    screen=$(xrandr --listmonitors | sed -nE 's/.*\+\*([^ ]+).*/\1/p')
    pkill mpvpaper
    mpvpaper -vs -o "loop no-audio" $screen $target_wallpaper >/dev/null 2>&1 &

    ### extract 1 frame of mp4 for theme config and signal

    name_without_ext=$(echo $name | sed -E 's/\.mp4//')
    cache_dir="$HOME/.cache/wallpapers/"
    if [[ ! -e $cache_dir ]]; then
        mkdir -p $cache_dir
    fi
    if [[ ! -e $cache_dir$name_without_ext".png" ]]; then
        echo "file not exist: "$cache_dir$name_without_ext".png"
        ffmpeg -i $target_wallpaper -f image2pipe -vcodec png -vframes 1 - >$cache_dir$name_without_ext".png"
    fi
    target_wallpaper=$cache_dir$name_without_ext".png"

else
    echo "not a picture"
    exit 1
fi

## link current wallpaper for further configuration

ln -sf $target_wallpaper ~/curr_wallpaper.png

## generate theme palette for system config

theme_dir="$HOME/.cache/wall_themes/"
if [[ ! -e $theme_dir ]]; then
    mkdir -p $theme_dir
fi

name=$(basename $target_wallpaper)
name_without_ext=$(echo $name | sed -E 's/\.png|\.jpg|\.jpeg//')
curr_mode=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ -n $(echo $curr_mode | grep light) ]]; then
    echo "current mode is light"
    config_dir=$theme_dir$name_without_ext"/light/"
else
    echo "current mode is dark"
    config_dir=$theme_dir$name_without_ext"/dark/"
fi

if [[ ! -e $config_dir ]]; then
    mkdir -p $config_dir
fi

color_config=$config_dir$name_without_ext".json"

template_dir="$HOME/workspace/Hyprland/theme-generator/src/convertor/templates/"

### not generate again for existed config

if [[ ! -e $color_config ]]; then
    if [[ -n $(echo $curr_mode | grep light) ]]; then
        ~/workspace/Hyprland/theme-generator/bin/themer.sh ~/curr_wallpaper.png --mode light -o $color_config
        ~/workspace/Hyprland/theme-generator/bin/convertor.sh -c $color_config -t $template_dir -o $config_dir
    else
        ~/workspace/Hyprland/theme-generator/bin/themer.sh ~/curr_wallpaper.png --mode dark -o $color_config
        ~/workspace/Hyprland/theme-generator/bin/convertor.sh -c $color_config -t $template_dir -o $config_dir
    fi
fi

### copy config to .config directory

sys_config="$HOME/.config/theme/"
if [[ ! -e $sys_config ]]; then
    mkdir -p $sys_config
fi

rm $sys_config*
cp $config_dir* $sys_config

## link config applications
ln -sf ~/.config/theme/kitty-themer.conf ~/.config/kitty/themes/kitty-themer.conf

## refresh system to apply config
~/.config/hypr/scripts/refresh.sh

magick ~/curr_wallpaper.png -resize 1920 ~/curr_wallpaper_down.png
