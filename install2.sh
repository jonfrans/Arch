#!/bin/bash

cp /etc/sudoers /

echo "temp ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

useradd -m temp
echo 123 | passwd -s temp 

su -l temp

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin/
makepkg -si --noconfirm

userdel -r temp 

mv /sudoers /etc/sudoers
