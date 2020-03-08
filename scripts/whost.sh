#!/bin/bash

WHO=$(dmenu < /dev/null)
SH=$(cat /etc/passwd | grep $WHO | awk -F':' '{print $NF}')
st -e su -c "cd; $SH" $WHO
