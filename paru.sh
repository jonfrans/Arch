#!/bin/bash

git clone https://aur.archlinux.org/paru-bin.git

cd paru-bin/

makepkg -si --noconfirm

paru -Syu oh-my-zsh-git --noconfirm

sudo cp -r /usr/share/oh-my-zsh/zshrc $HOME/

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

