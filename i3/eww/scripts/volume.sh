#!/bin/bash

function update_eww(){
   eww update "$1"
}

function getmute(){
    ismute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk -F':' '{print $2}')

    echo "$ismute"
}

function getvol(){

volume="$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '{print $2}')"

echo $volume
}

function increasevol(){
    eww open osd

    pactl set-sink-volume @DEFAULT_SINK@ +2%

    newvol=$(getvol)
    ismute=$(getmute)

    if [ $ismute = 'yes' ];then
        update_eww $(echo "volume=0%")
    else
        update_eww $(echo "volume=$newvol")
    fi
    sleep 1.5
    eww close-all
}


function decreasevol(){
    eww open osd

    pactl set-sink-volume @DEFAULT_SINK@ -2%
    newvol=$(getvol)
    ismute=$(getmute)
    if [ $ismute = 'yes' ];then
        update_eww $(echo "volume=0%")
    else
        update_eww $(echo "volume=$newvol")
    fi
    sleep 1.5
    eww close-all
}

function mutevol(){
    eww open osd

    pactl set-sink-mute @DEFAULT_SINK@ toggle
    newvol=$(getvol)
    ismute=$(getmute)
    if [ $ismute = 'yes' ];then
        update_eww $(echo "volume=0%")
    else
        update_eww $(echo "volume=$newvol")
    fi
    sleep 1.5
    eww close-all
}

while getopts "idm" OPT;do
    case $OPT in
        i)
            increasevol
            ;;
        d)
            decreasevol
            ;;
        m)
            mutevol
            ;;
    esac
done