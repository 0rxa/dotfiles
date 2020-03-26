#!/bin/bash

prefix=$HOME/.scripts/monitors/
profile=$(find $HOME/.scripts/monitors -type f \
	| awk -F '/' '{print $NF}' \
	| awk -F '.' '{print $1}' \
	| dmenu -i)
[[ $profile = "" ]] && exit
bash $prefix$profile.sh
i3-msg restart
