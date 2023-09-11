#!/bin/bash

source colors.sh
#st - start
st="\033["
end="\033[0m"

if [ $# != 0 ]; then
    status=1
    if [[ $1 == [1-6] && $2 == [1-6] && $3 == [1-6] && $4 == [1-6] ]]; then
        #cc - color codes
        cc1="${color_codes[$1]}" 
        cc2="${color_codes[$2]}"
        cc3="${color_codes[$3]}"
        cc4="${color_codes[$4]}"
        # c - color
        c1="${color_map_bg[$cc1]}"
        c2="${color_map_text[$cc2]}"
        c3="${color_map_bg[$cc3]}"
        c4="${color_map_text[$cc4]}"
        status=0
    fi    
fi

HOSTNAME="$(hostname)"
TIMEZONE="$(timedatectl show --property=Timezone --value)"
USERNAME="$USER"
OS="$(cat /etc/issue | sed -r '/^\s*$/d' | awk '{print  $1,$2,$3}')"
DATE="$(date +%d\ %b\ %Y\ %T)"
UPTIME="$(uptime -p)" 
UPTIME_SEC="$(awk '{print $1}' /proc/uptime)"
IP="$(hostname -I | awk '{print $1}')"
MASK="$(ifconfig lo | grep netmask | awk '{print $4}')"
# MASK="$(ip -o -f inet addr show | awk '/scope global/ {print $4}')""
GATEWAY="$(ip r | grep default | awk '{print $3}')"
RAM_TOTAL="$(free | grep Mem | awk '{printf "%.3f", $2/1000000}') GB"
RAM_USED="$(free | grep Mem | awk '{printf "%.3f", $3/1000000}') GB"
RAM_FREE="$(free | grep Mem | awk '{printf "%.3f", $4/1000000}') GB"
SPACE_ROOT="$(df /root | grep / | awk '{printf "%2.f", $2/1000}') MB"
SPACE_ROOT_USED="$(df /root | grep / | awk '{printf "%2.f", $3/1000}') MB"
SPACE_ROOT_FREE="$(df /root | grep / | awk '{printf "%2.f", $4/1000}') MB"
 
echo -e ""$st""$c1";"$c2"mHOSTNAME        = "$st""$c3";"$c4"m"$HOSTNAME""
echo -e ""$st""$c1";"$c2"mTIMEZONE        = "$st""$c3";"$c4"m"$TIMEZONE""
echo -e ""$st""$c1";"$c2"mUSERNAME        = "$st""$c3";"$c4"m"$USERNAME""
echo -e ""$st""$c1";"$c2"mOS              = "$st""$c3";"$c4"m"$OS""
echo -e ""$st""$c1";"$c2"mDATE            = "$st""$c3";"$c4"m"$DATE""
echo -e ""$st""$c1";"$c2"mUPTIME          = "$st""$c3";"$c4"m"$UPTIME""
echo -e ""$st""$c1";"$c2"mUPTIME_SEC      = "$st""$c3";"$c4"m"$UPTIME_SEC""
echo -e ""$st""$c1";"$c2"mIP              = "$st""$c3";"$c4"m"$IP""
echo -e ""$st""$c1";"$c2"mMASK            = "$st""$c3";"$c4"m"$MASK""
echo -e ""$st""$c1";"$c2"mGATEWAY         = "$st""$c3";"$c4"m"$GATEWAY""
echo -e ""$st""$c1";"$c2"mRAM_TOTAL       = "$st""$c3";"$c4"m"$RAM_TOTAL""
echo -e ""$st""$c1";"$c2"mRAM_USED        = "$st""$c3";"$c4"m"$RAM_USED""
echo -e ""$st""$c1";"$c2"mRAM_FREE        = "$st""$c3";"$c4"m"$RAM_FREE""
echo -e ""$st""$c1";"$c2"mSPACE_ROOT      = "$st""$c3";"$c4"m"$SPACE_ROOT""
echo -e ""$st""$c1";"$c2"mSPACE_ROOT_USED = "$st""$c3";"$c4"m"$SPACE_ROOT_USED""
echo -e ""$st""$c1";"$c2"mSPACE_ROOT_FREE = "$st""$c3";"$c4"m"$SPACE_ROOT_FREE""$end""
echo

if [[ $# == 0 || $status ]]; then
    echo "Column 1 background = default (black)"
    echo "Column 1 font color = default (white)"
    echo "Column 2 background = default (black)"
    echo "Column 2 font color = default (white)"
else 
    echo "Column 1 background = $1 ($cc1)"
    echo "Column 1 font color = $2 ($cc2)"
    echo "Column 2 background = $3 ($cc3)"
    echo "Column 2 font color = $4 ($cc4)"
fi  