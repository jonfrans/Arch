#!/bin/bash

sudo pacman -Syu hyprland hyprpolkitagent qt5-wayland swww sddm qt6-wayland xdg-desktop-portal-hyprland pipewire pipewire-pulse wireplumber kitty --noconfirm

mkdir -p ~/.config/hypr/

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/hyprland.conf > ~/.config/hypr/hyprland.conf



