#!/bin/bash

sudo pacman -Syu hyprland hyprpolkitagent qt5-wayland swww sddm qt6-wayland rofi-wayland xdg-desktop-portal-hyprland pipewire pipewire-pulse pavucontrol wireplumber kitty --noconfirm

sudo systemctl enable sddm

mkdir -p ~/.config/hypr/

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/hyprland.conf > ~/.config/hypr/hyprland.conf

git clone https://github.com/elkowar/eww

cd eww

cargo build --release --no-default-features --features=wayland

cd ./target/release

chmod +x ./eww
