#!/bin/bash

# Format:
# WM_CLASS(STRING) = "qutebrowser", "qutebrowser"

cmd="compton --invert-color-include 'class_g=\""
str=$(xprop | grep -i wm_class | sed 's/.*"\(.*\)".*/\1/')
cmd=$cmd"$str\"' -b"

#cmd="compton --invert-color-include 'class_g=\"$(xprop | grep -i wm_class | sed 's/.*"\(.*\)".*/\1/')\"' -b"

pid=$(pidof compton)
if [ "$pid" != "" ]; then
	kill $pid
fi

echo $cmd | bash
# compton --invert-color-include 'class_g="$str"' -b
