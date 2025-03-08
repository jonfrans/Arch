#!/bin/bash

user="$(cat /user.txt)"

echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

su -l $user -c bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/yay.sh)


