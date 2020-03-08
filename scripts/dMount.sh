#!/bin/bash

drive=$(lsblk | sed "/^[[:alnum:]]/d;s/^\W*//; /[/[:alnum:]]$/d" | awk '{print $1}' | dmenu -i)
if ! [ -z "$drive" ]; then
	udevil mount /dev/$drive /media/$drive 2> /tmp/err
fi

ret=$( cat /tmp/err )
if ! [ -z "$ret" ]; then
	notify-send "Umount" "$ret"
fi

rm /tmp/err
