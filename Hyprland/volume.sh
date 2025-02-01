#!/bin/bash
	

while getopts idm OPTION; do
    case $OPTION in
     i)
       pactl set-sink-volume @DEFAULT_SINK@ +2% 
       volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F"/" '{print $2}')
       notify-send -t 500 -r 913  "$volume"
       ;;
     d)
       pactl set-sink-volume @DEFAULT_SINK@ -2%
       volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F"/" '{print $2}')
       notify-send -t 500 -r 913 "$volume"
       ;;
     m)
       mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk -F: '{print $2}')
       if [ $mute = 'yes' ]; then
          notify-send -t 500 -r 913 'unmuted'
       else
          notify-send -t 500 -r 913 'muted'
       fi
       pactl set-sink-mute @DEFAULT_SINK@ toggle
       ;;
    esac
done
