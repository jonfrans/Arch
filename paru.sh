#!/bin/bash

git clone https://aur.archlinux.org/paru-bin.git

cd paru-bin/

makepkg -si --noconfirm

paru -Syu oh-my-zsh-git --noconfirm



