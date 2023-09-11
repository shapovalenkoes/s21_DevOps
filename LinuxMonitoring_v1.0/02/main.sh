#!/bin/bash


if [ $# != 0 ]; then
    echo "Too many arguments"
else
    chmod +x print.sh
    ./print.sh
    read -p "Save log? (Y/N) " answer
    if [[ "$answer" == y || "$answer" == Y ]]; then
        ./print.sh > $(date +%d_%m_%y_%H_%M_%S).status
    fi
fi    