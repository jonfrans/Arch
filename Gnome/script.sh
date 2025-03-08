#!/bin/bash

sudo pacman -Syu gnome gdm

sudo systemctl enable gdm

gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 2
