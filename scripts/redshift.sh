#!/bin/bash

var=$(echo -e "Set\nReset\nAdd" | dmenu -i)

if [ $var == "Set" ]; then
	redshift -x
	redshift -l 41.18:19.56 -b 1 -O 3000K
elif [ $var == "Add" ]; then
	redshift -l 41.18:19.56 -b 1 -O 3000K
else
	redshift -x
fi
