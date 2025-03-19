#!/bin/bash

sudo pacman -Syu hyprland hyprpolkitagent qt5-wayland swww sddm qt6-wayland xdg-desktop-portal-hyprland pipewire pipewire-pulse wireplumber kitty --noconfirm

sudo pacman -S gtk3 gtk-layer-shell pango gdk-pixbuf2 libdbusmenu-gtk3 cairo glib2 gcc-libs glibc rustup --noconfirm

sudo systemctl enable sddm

mkdir -p ~/.config/hypr/

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/hyprland.conf > ~/.config/hypr/hyprland.conf

git clone https://github.com/elkowar/eww

cd eww

cargo build --release --no-default-features --features=wayland
