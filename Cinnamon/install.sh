#!/bin/bash

sudo pacman -Syu cinnamon cinnamon-translations

yay -Syu mint-artwork --noconfirm

sudo systemctl enable lightdm
