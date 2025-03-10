#!/bin/bash

sudo pacman -Syu hyprland hyprpolkitagent qt5-wayland swww sddm qt6-wayland rofi-wayland xdg-desktop-portal-hyprland pipewire pipewire-pulse pavucontrol wireplumber kitty --noconfirm

sudo systemctl enable sddm

mkdir -p ~/.config/hypr/

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/hyprland.conf > ~/.config/hypr/hyprland.conf

pacman -Syu waybar
mkdir -p $home/.config/Waybar/
curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/Waybar/config.jsonc > ~/.config/Waybar/config.jsonc
curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/Waybar/style.css > ~/.config/Waybar/style.css

