#!/bin/bash

user="$(cat /user.txt)"


su -l $user -c bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/yay.sh)


