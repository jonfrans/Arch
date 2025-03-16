#!/bin/bash

sudo pacman -Syu i3-wm lightdm lightdm-gtk-greeter feh rustup gtk3 gtk-layer-shell pango gdk-pixbuf2 libdbusmenu-gtk3 cairo glib2 gcc-libs glibc --noconfirm

git clone https://github.com/elkowar/eww

cd eww

cargo build --release --no-default-features --features x11

cd ./target/release

chmod +x ./eww

