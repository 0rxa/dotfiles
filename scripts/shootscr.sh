#!/bin/bash

ttl="Screenshot"
dsc="Automatic name"

if ! [ -z "$1" ]; then
	name=$(dmenu < /dev/null)
	if [ "$name" == "" ]; then
		notify-send "Error" "No name given"
		exit 1
	elif [ "${name: -1}" == "/" ]; then
		name=$name"%Y-%m-%d_\$wx\$h.png"
		dsc=$name
	elif [ "${name: -3}" != "png" ]; then
		name="$name.png"
		dsc=$name
	fi
fi

scrot $name 2> /tmp/err
err=$(cat /tmp/err)
if [ -z "$err" ]; then
	notify-send "$ttl" "$dsc"
else
	notify-send "$ttl" "$err"
fi
