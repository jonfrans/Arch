#!/bin/bash

mkfs.xfs -f /dev/sda3

mkfs.vfat /dev/sda1

mkswap /dev/sda2

swapon /dev/sda2

mount /dev/sda3 /mnt

mount /dev/sda1 --mkdir /mnt/efi

pacstrap -K /mnt base linux-zen linux-zen-headers linux-firmware  sudo nano 

arch-chroot /mnt
