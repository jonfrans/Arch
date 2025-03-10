#!/bin/bash

sudo pacman -Syu hyprland hyprpolkitagent qt5-wayland swww sddm qt6-wayland rofi-wayland xdg-desktop-portal-hyprland pipewire pipewire-pulse pavucontrol wireplumber kitty --noconfirm

sudo systemctl enable sddm

mkdir -p ~/.config/hypr/

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/hyprland.conf > ~/.config/hypr/hyprland.conf

echo "Você vai querer uma barra de status?(Y/n)"
read status

while true;do
 case $status in
   Y | y | "")
    echo "Qual você quer?"
    echo "[1] Waybar"
    echo "[2] Eww"
    read bar

    case $bar in
      1)
        pacman -Syu waybar
        mkdir -p $home/.config/Waybar/
        curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/Waybar/config.jsonc > ~/.config/Waybar/config.jsonc
        curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/Waybar/style.css > ~/.config/Waybar/style.css
        break
        ;;
      2)
        echo "Chegando em breve"
        break
        ;;
    break
    ;;
   N | n)
    break
    ;;
   *)
    echo ""
    ;;
done


