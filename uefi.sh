#!/bin/bash

mkinitcpio -P

efibootmgr -c -d /dev/sda -p 1 -L "Arch Linux" -l "\EFI\Linux\arch-linux-zen.efi" -u

