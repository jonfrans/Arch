#!/bin/bash

user="$(cat /user.txt)"

mkinitcpio -P

efibootmgr -c -d /dev/sda -p 1 -L "Arch Linux" -l "\EFI\Linux\arch-linux-zen.efi" -u

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/DE.sh > /home/$user/de.sh
