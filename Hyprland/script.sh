#!/bin/bash

sudo pacman -Syu hyprland hyprpolkitagent qt5-wayland qt6-wayland rofi-wayland waybar pipewire pipewire-pulse pavucontrol wireplumber ttf-space-mono-nerd otf-font-awesome kitty hyprpaper --noconfirm

mkdir -p ~/.config/hypr
mkdir -p ~/.config/rofi
mkdir -p ~/.config/waybar

cp -r /scripts/Hyprland/hyprland.conf ~/.config/hypr/
cp -r /scripts/Hyprland/config.jsonc ~/.config/waybar/
cp -r /scripts/Hyprland/style.css ~/.config/waybar/
cp -r /scripts/Hyprland/volume.sh ~/

chmod +x ~/volume.sh
