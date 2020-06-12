#!/bin/bash

FOCUSED_WINDOW_X_ID=$(xdotool getwindowfocus | cut -d' ' -f3)
CURRENT_TERM_PID=$(xprop -id $FOCUSED_WINDOW_X_ID _NET_WM_PID | cut -d' ' -f3)
SHELL_PID=$(ps --ppid $CURRENT_TERM_PID -o pid=)
SHELL_CWD=$(lsof -p $SHELL_PID | awk '$4=="cwd" {print $9}')

termite -d "$SHELL_CWD" 2>&1 >/dev/null &
