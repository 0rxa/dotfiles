#!/bin/bash

var=$(echo -e "Shutdown\nRestart\nCancel" | dmenu -i)

if [ $var == "Shutdown" ]; then
	shutdown -h now
elif [ $var == "Restart" ]; then
	shutdown -r now
fi
