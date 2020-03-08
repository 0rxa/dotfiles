#!/bin/bash

query=$(dmenu -p 'Google search: ' -i < /dev/null)
echo $query
qutebrowser "gogle.com/#q=$query" --target window
