# Packages

Here are the most of the packages needed and what they are : 

## 01 Body

### 1.1 `Hyprland`

```bash
yay -S hyprland-git
```

### 1.2 `Waybar`

```bash
sudo pacman -S waybar
```

### 1.3 `rofi` 

```bash
yay -S rofi-lbonn-wayland-git
yay -S rofi-calc-git
# this version will not have the problem of the focusing
```

## 02 Terminal

```bash
sudo pacman -S fish kitty
```

## 03 Utils

### 3.1 files

```bash
sudo pacman -S ranger 			# a cmd file manager
sudo pacman -S dolphin			# a gui file manager
sudo pacman -S ark				# a gui archive manager
sudo pacman -S zip unzip		# the support for `zip`
yay -S 7-zip					# the 7-zip archive manager, additional but recommended
sduo pacman -S ntfs-3g			# provides NTFS file system support

sudo pacman -S vim neovim			# cmd editors
yay -S visual-studio-code-bin		# editor
yay -S zed-git						# editor

# pdf viewer
sudo pacman -S zathura zathura-pdf-poppler
```

### 3.2 multimedias

```bash
sudo pacman -S feh		# a light picture shower, optional : `gwenview` - a powerful picture shower

sudo pacman -S vlc		# a powerful video player, optional : `mpv` - a light video player
sudo pacman -S mpv

sudo pacman -S qmmp		# a light music player
yay -S musikcube		# a cmd music player
```

### 3.3 clipboard

```bash
sudo pacman -S wl-clipboard cliphist	# support the text and img clip and paste
```

### 3.4 policy

```bash
sudo pacman -S polkit-kde-agent			# the polkit agent
```

### 3.5 System wide

```bash
sudo pacman -S calc-git					# a calculator
sudo pacman -S hyprpicker				# the colorpicker
sudo pacman -S hyprlock					# the lock screen
sudo pacman -S swww						# the wallpaper manager
yay -S mpvpaper							# mp4 to wallpaper
sudo pacman -S grimblast				# the screenshot utils from grim
sudo pacman -S swappy					# the light picture editor for screenshot
```
### 3.6 plugins

```bash
# the plugins for ranger
sudo pacman -S atool less 				# archive file preview
sudo pacman -S highlight 				# code highlight
sudo pacman -S python-pillow 			# image preview
sudo pacman -S ffmpegthumbnailer 		# video preview
sudo pacman -S catdoc docx2txt 			# doc docx preview
```

### 3.7 browser

```bash
sudo pacman -S firefox
```

## 04 Devices

```bash
sudo pacman -S brightnessctl			# the backlight controller
sudo pacman -S bluez bluez-utils		# the bluetooth utils, optional : `blueman` - a gui bluetooth manager
sudo pacman -S pipewire wireplumber		# the multimedia framwork
sudo pacman -S pamixer pavucontrol		# the gui volume controller
sudo pacman -S networkmanager			# the network cmd manager, optional: `network-manager-applet` - a gui manager
sudo pacman -S xorg-xrdb				# optional, for the high dpi screen to change the dpi of the x11 apps
sudo pacman -S neofetch btop			# catch the system infomations
sudo pacman -S power-profiles-daemon	# the power profiles, optional : `tlp`, `tlpui` - a powerful third part utils
```

## 05 Input Method

```bash
sudo pacman -S fcitx5 fcitx5-chinese-addons				# the engine of the input method
sudo pacman -S fcitx5-configtool						# gui config tool
sudo pacman -S wqy-zenhhei								# chinese characters
sudo pacman -S nerd-fonts noto-fonts noto-fonts-emoji	# additional fonts (recommended)
yay -S fcitx5-input-support								# input method support
```

## 06 System

```bash
sudo pacman -S xdg-desktop-portal-hyprland-git		# the desktop portal
sudo pacman -S qt5-wayland qt6-wayland				# the qt support in wayland
sudo pacman -S xorg-xwayland						# xorg applications wayland support
```

## 07 Display Manager(Login Manager)

```bash
sudo pacman -S sddm
# other optional : `gdm`, `lightdm`
```

## 08 Driver

```bash
sudo pacman -S nvidia nvidia-utils
sudo pacman -S egl-wayland
```

# Others

Beyond these packages, there are other useful util to be discovered.

You can see [Useful Utils](./CONFLIST.md) for more informations.
