#!/bin/bash

sudo pacman -Syu i3-wm lightdm lightdm-gtk-greeter

git clone https://github.com/elkowar/eww

cd eww

cargo build --release --no-default-features --features x11

cd ./target/release

chmod +x ./eww
