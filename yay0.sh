#!/bin/bash

cp /etc/sudoers /sudoers.bak

echo "temp ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

useradd -m -s /bin/bash temp
echo 123 | passwd -s temp 

su -l temp -c bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/yay.sh)


