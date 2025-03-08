#!/bin/bash

user="$(cat /user.txt)"
home=/home/$user 

sudo pacman -Syu hyprland hyprpolkitagent qt5-wayland qt6-wayland rofi-wayland  pipewire pipewire-pulse pavucontrol wireplumber  kitty --noconfirm

mkdir -p $home/.config/hypr/

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/hyprland.conf > $home/.config/hypr/hyprland.conf

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
        curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/Waybar/config.jsonc > $home/.config/Waybar/config.jsonc
        curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/Waybar/style.css > $home/.config/Waybar/style.css
        ;;
      2)
        echo "Chegando em breve"
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
