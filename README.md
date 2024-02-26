# Hyprland Settings
## 01 Contents

This is the repository storing the config files of hyprland settings **based on** [@SolDoesTech](https://github.com/SolDoesTech). It is made up of :

* `hypr` : the basic hyprland settings
* `waybar` : the waybar settings and the scripts
* `wlogout` : the wlogout settings and the icons
* `swaylock` : the swaylock settings
* `tofi` : applications launcher
* `ranger` : the command line file manager
* `sddm-astronaut-theme` : the sddm theme from [@keyitdev](https://github.com/keyitdev/sddm-astronaut-theme.git)
* `kitty` : the terminal settings
* `mako` : the message settings
* `Background` : two images I prefer
* `vscode-theme` : the vscode-theme based on the default theme which provides **the enhanced color support for C/C++**
* `fcitx5-dracula-theme` : the fcitx5 theme from [@drbbr](https://github.com/drbbr) 

## 02 Packages
### 2.1 Body
#### 1. `Hyprland`

```bash
yay -S hyprland
```

#### 2. `Waybar`

```bash
yay -S waybar
```

#### 3. `Wlogout`

```bash
yay -S wlogout
```

#### 4. `Swaylock-effects`

```bash
yay -S swaylock-effects
```

### 2.4 Terminal

```bash
yay -S fish kitty
```

### 2.5 Utils

```bash
yay -S ranger mako tofi musikcube thunar thunar-archive-plugin ark file-roller gvfs ntfs-3g wl-clipboard cliphist hyprpicker swww btop xdg-desktop-portal-hyprland xdg-xrdb polkit qt5-wayland qt6-wayland lxappearance xfce4-settings
```

### 2.6 Devices

```bash
yay -S brightnessctl bluez bluez-utils blueman network-manager-applet pamixer pavucontrol pipewire wireplumber pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-qt pavolume
```

### 2.7 Input Method

```bash
yay -S fcitx5 fcitx5-chinese-addons fcitx5-configtool fcitx5-input-support ttf-jetbrains-mono-nerd noto-fonts-emoji wqy-zenhei
```

### 2.8 Display Manager

```bash
yay -S sddm
```

## 03 Config

Copy the config files to `~/.config` and copy the themes to the specific path.
