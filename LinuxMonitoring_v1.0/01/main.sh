#!/bin/bash


re='^[+-]?[0-9]+([.][0-9]+)?$'

if [ $# != 1 ]; then 
    echo "Try again. Must be 1 argument"
else 
    if [[ $1 =~ $re ]]; then 
        echo "Incorrect input"
    else echo "$1" 
    fi
fi
