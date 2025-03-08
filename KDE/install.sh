#!/bin/bash

sudo pacman -Syu plasma-meta

sudo systemctl enable sddm

sudo su - -c bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/uefi.sh)
