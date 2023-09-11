#!/bin/bash


if [ $# != 4 ]; then
    echo "Try again. Must be 4 arguments"
elif [[ $1 != [1-6] || $2 != [1-6] || $3 != [1-6] || $4 != [1-6] ]]; then
    echo "Try again. Arguments must be digits from 1 to 6"
elif [[ $1 == $2 || $3 == $4 ]]; then
    echo "Try again. Background and text colors can't be the same"
else
    chmod 777 print.sh
    ./print.sh $1 $2 $3 $4
fi    