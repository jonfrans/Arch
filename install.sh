#!/bin/bash

while true; do

echo "Você desejaria particionar o sistema?(Y/n)"
read choice 

case $choice in
  Y | y)
   parted /dev/sda --script mklabel gpt mkpart P1 fat32 1MiB 1GiB mkpart P2 xfs 1GiB 30GiB mkpart P3 xfs 30GiB 100%
   parted /dev/sda --script set 1 esp on set 3 linux-home on
   parted /dev/sda --script type 1 C12A7328-F81F-11D2-BA4B-00A0C93EC93B type 2 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709 type 3 933AC7E1-2EB4-4F13-B844-0E14E2AEF915
   break
   ;;
  N | n)
   echo "Pulando essa etapa"
   break
   ;;
  "")
   parted /dev/sda --script mklabel gpt mkpart P1 fat32 1MiB 1GiB mkpart P2 xfs 1GiB 30GiB mkpart P3 xfs 30GiB 100%
   parted /dev/sda --script set 1 esp on set 3 linux-home on
   parted /dev/sda --script type 1 C12A7328-F81F-11D2-BA4B-00A0C93EC93B type 2 4F68BCE3-E8CD-4DB1-96E7-FBCAF9 type 3 933AC7E1-2EB4-4F13-B844-0E14E2AEF915
   break
   ;;
  *)
   ;;
esac

done

echo "Aperte ENTER para continuar..."
read input

mkfs.xfs -f /dev/sda2 && mkfs.xfs -f /dev/sda3 && mkfs.fat -F 32 /dev/sda1

mount /dev/sda2 /mnt

mkdir -p /mnt/efi

mount /dev/sda1 /mnt/efi

mkdir -p /mnt/home

mount /dev/sda3 /mnt/home 

echo "Você está usando placa da NVIDIA?(y/N)"
read nvidia

if [ $nvidia = "Y" | "y" ]; then
  pacstrap -K /mnt base git base-devel linux-zen linux-zen-headers linux-firmware xfsprogs sudo nano nvidia-dkms
else
  pacstrap -K /mnt base git base-devel linux-zen linux-zen-headers linux-firmware xfsprogs sudo nano 
fi 

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/install2.sh)
