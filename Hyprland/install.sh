#!/bin/bash

sudo pacman -Syu hyprland hyprpolkitagent qt5-wayland swww sddm qt6-wayland xdg-desktop-portal-hyprland pipewire pipewire-pulse wireplumber kitty --noconfirm

mkdir -p ~/.config/hypr ~/.config/waybar

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/hyprland.conf > ~/.config/hypr/hyprland.conf

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/Waybar/config.jsonc > ~/.config/waybar/config.jsonc

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/Waybar/style.css > ~/.config/waybar/style.css

