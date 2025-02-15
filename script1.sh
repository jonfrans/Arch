#!/bin/bash

mkfs.xfs -f /dev/sda3 && mkfs.fat -F 32 /dev/sda1 && mkfs.xfs -f /dev/sda4 && mkswap /dev/sda2  

swapon /dev/sda2

mount /dev/sda3 /mnt

mount /dev/sda4 /mnt/home

mount /dev/sda1 --mkdir /mnt/efi

pacstrap -K /mnt base git base-devel linux-zen linux-zen-headers linux-firmware xfsprogs sudo nano

genfstab -U /mnt >> /mnt/etc/fstab
