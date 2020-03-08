#!/bin/bash

kill $(ps aux | grep -v grep | grep -i udiskie | awk '{print $2}')
udiskie --tray
