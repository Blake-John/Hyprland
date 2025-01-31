#!/usr/bin/env bash

if [ -z "$(gsettings get org.gnome.desktop.interface color-scheme | grep light)" ]; then
	echo "Now is Dark Mode, Change to Light Mode"
	# 设置 gnome shell 及 gtk 应用
	gsettings set org.gnome.shell.extensions.user-theme name \'Graphite-Light\'
	gsettings set org.gnome.desktop.interface color-scheme \'prefer-light\'
	gsettings set org.gnome.desktop.interface gtk-theme \'Graphite-Light\'
	sed -i -E "s/gtk-theme-name=(.*?)/gtk-theme-name=Graphite-Light/" ~/.config/gtk-3.0/settings.ini
	sed -i -E "s/gtk-application-prefer-dark-theme=(.)/gtk-application-prefer-dark-theme=0/" ~/.config/gtk-3.0/settings.ini
	sed -i -E "s/gtk-icon-theme-name=(.*?)/gtk-icon-theme-name=Papirus/" ~/.config/gtk-3.0/settings.ini
	sed -i -E "s/gtk-theme-name=(.*?)/gtk-theme-name=Graphite-Light/" ~/.config/gtk-4.0/settings.ini
	sed -i -E "s/gtk-application-prefer-dark-theme=(.)/gtk-application-prefer-dark-theme=0/" ~/.config/gtk-4.0/settings.ini
	

	# 设置 Qt 应用
	sed -i -E "s/theme=(.*?)/theme=Graphite-rimless/" ~/.config/Kvantum/kvantum.kvconfig

	# 设置 rofi
	sed -i -E "s/@import \"\.\.\/colors\/rofi-(.*?)\.rasi\"/@import \"..\/colors\/rofi-light\.rasi\"/" ~/.config/rofi/shared/colors.rasi
	# 设置 waybar
	sed -i -E "s/@import \"\.\/color-(.*?)\.css\";/@import \"\.\/color-light\.css\";/" ~/.config/waybar/color.css

	# 设置 xsetting
	sed -i -E "s/Net\/ThemeName \"Graphite-(.*?)\"/Net\/ThemeName \"Graphite-Light\"/" ~/.config/xsettingsd/xsettingsd.conf
	sed -i -E "s/Net\/IconThemeName \"(.*?)\"/Net\/IconThemeName \"Papirus\"/" ~/.config/xsettingsd/xsettingsd.conf

	# 设置 kitty
	sed -i -E "s/include \.\/theme-(.*?)\.conf/include \.\/theme-light.conf/" ~/.config/kitty/kitty.conf

	# 设置 neovim
	sed -i -E "s/colorfulcode-(.*?)\"\)/colorfulcode-light\"\)/" ~/.config/nvim/lua/plugins/ui.lua
	sed -i -E "s/colorfulcode-(.*?)\/\",/colorfulcode-light\/\",/" ~/.config/nvim/lua/plugins/ui.lua

	if [ -e ~/.local/share/nwg-look/ ]; then
		echo "Exist"
		sed -i -E "s/gtk-theme=(.*?)/gtk-theme=Graphite-Light/" ~/.local/share/nwg-look/gsettings
		sed -i -E "s/icon-theme=(.*?)/icon-theme=Papirus/" ~/.local/share/nwg-look/gsettings
	else 
		echo "Not Exist"
	fi

else 
	echo "Now is Light Mode, Change to Dark Mode"
	# 设置 gnome shell 及 gtk 应用
	gsettings set org.gnome.shell.extensions.user-theme name \'Graphite-Dark\'
	gsettings set org.gnome.desktop.interface color-scheme \'prefer-dark\'
	gsettings set org.gnome.desktop.interface gtk-theme \'Graphite-Dark\'
	sed -i -E "s/gtk-theme-name=(.*?)/gtk-theme-name=Graphite-Dark/" ~/.config/gtk-3.0/settings.ini
	sed -i -E "s/gtk-application-prefer-dark-theme=(.)/gtk-application-prefer-dark-theme=1/" ~/.config/gtk-3.0/settings.ini
	sed -i -E "s/gtk-icon-theme-name=(.*?)/gtk-icon-theme-name=Papirus/" ~/.config/gtk-3.0/settings.ini
	sed -i -E "s/gtk-theme-name=(.*?)/gtk-theme-name=Graphite-Dark/" ~/.config/gtk-4.0/settings.ini
	sed -i -E "s/gtk-application-prefer-dark-theme=(.)/gtk-application-prefer-dark-theme=1/" ~/.config/gtk-4.0/settings.ini

	# 设置 Qt 应用
	sed -i -E "s/theme=(.*?)/theme=Graphite-rimlessDark/" ~/.config/Kvantum/kvantum.kvconfig

	# 设置 rofi
	sed -i -E "s/@import \"\.\.\/colors\/rofi-(.*?)\.rasi\"/@import \"..\/colors\/rofi-dark\.rasi\"/" ~/.config/rofi/shared/colors.rasi
	# 设置 waybar
	sed -i -E "s/@import \"\.\/color-(.*?)\.css\";/@import \"\.\/color-dark\.css\";/" ~/.config/waybar/color.css

	# 设置 xsetting
	sed -i -E "s/Net\/ThemeName \"Graphite-(.*?)\"/Net\/ThemeName \"Graphite-Dark\"/" ~/.config/xsettingsd/xsettingsd.conf
	sed -i -E "s/Net\/IconThemeName \"(.*?)\"/Net\/IconThemeName \"Papirus\"/" ~/.config/xsettingsd/xsettingsd.conf

	# 设置 kitty
	sed -i -E "s/include \.\/theme-(.*?)\.conf/include \.\/theme-dark.conf/" ~/.config/kitty/kitty.conf

	# 设置 neovim
	sed -i -E "s/colorfulcode-(.*?)\"\)/colorfulcode-dark\"\)/" ~/.config/nvim/lua/plugins/ui.lua
	sed -i -E "s/colorfulcode-(.*?)\/\",/colorfulcode-dark\/\",/" ~/.config/nvim/lua/plugins/ui.lua

	if [ -e ~/.local/share/nwg-look/ ]; then
		echo "Exist"
		sed -i -E "s/gtk-theme=(.*?)/gtk-theme=Graphite-Dark/" ~/.local/share/nwg-look/gsettings
		sed -i -E "s/icon-theme=(.*?)/icon-theme=Papirus/" ~/.local/share/nwg-look/gsettings
	else 
		echo "Not Exist"
	fi
fi

pkill waybar
waybar > /dev/null 2>&1 &
