#!/bin/bash


declare -A color_map_text
color_map_text=( ["white"]="37"
                 ["red"]="31"
                 ["green"]="32"
                 ["blue"]="34"
                 ["purple"]="35"
                 ["black"]="30" )

declare -A color_map_bg
color_map_bg=( ["white"]="47"
               ["red"]="41"
               ["green"]="42"
               ["blue"]="44"
               ["purple"]="45"
               ["black"]="40" )

declare -A color_codes
color_codes=( ["1"]="white"
              ["2"]="red"
              ["3"]="green"
              ["4"]="blue"
              ["5"]="purple"
              ["6"]="black" )
