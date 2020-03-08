#!/bin/bash
vol=$(pactl list sinks | grep Volume | sed -e '2d' | cut -f2 -d"/" | cut -f1 -d"%" | cut -b 2-)

if [ $vol -eq 0 ]; then
	pactl set-sink-volume 0 100%
else
	pactl set-sink-volume 0 0%
fi
