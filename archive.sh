#!/bin/bash

dir=$(pwd | awk -F'/' '{print $NF}')
cd ..
tar cvf "$dir.tar" "$dir"
