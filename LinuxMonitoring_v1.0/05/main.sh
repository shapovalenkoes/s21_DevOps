#!/bin/bash


if [[ $# != 1 || ${1: -1} != "/" ]]; then 
    echo "Try again. Must be 1 argument ended by '/'"
else 
    if [[ ! -d "$1" ]]; then 
        echo "$1 doesn't exist"
    else
        chmod +x print.sh 
        ./print.sh $1
    fi
fi 