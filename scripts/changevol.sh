#!/bin/bash

sink=$(pactl list short sinks | grep RUNNING | awk '{print $1}')
[ "$sink" == "" ] && sink=0
notify='vol'

if [ "$1" == "" ]
then
	pactl set-sink-volume $sink 100%
elif [ "$1" == "+" ]
then
	pactl set-sink-volume $sink +5%
elif [ "$1" == "-" ]
then
	pactl set-sink-volume $sink -5%
elif [ "$1" == "tm" ]
then
	pactl set-sink-mute $sink toggle
	notify='mute'
fi

if [ "$notify" == "vol" ]
then
	notify-send -t 500 "Volume" "$($HOME/.scripts/getvol)"
elif [ "$notify" == "mute" ]
then
	notify-send -t 500 "Volume" "Toggled Mute"
fi
