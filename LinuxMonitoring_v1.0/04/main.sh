#!/bin/bash


if [ $# != 0 ]; then
    echo "Try again. Must be 0 arguments"
else
    chmod 777 print.sh
    source config.sh
    ./print.sh $column1_background $column1_font_color $column2_background $column2_font_color
fi    