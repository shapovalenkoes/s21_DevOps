#!/bin/bash


echo "HOSTNAME = $HOSTNAME" 
echo "TIMEZONE = $(timedatectl show --property=Timezone --value)" 
echo "USER = $USER" 
echo OS = $(awk '{print $1, $2, $3}' /etc/issue)
echo "DATE = $(date +%d\ %b\ %Y\ %T)" 
echo "UPTIME = $(uptime -p)" 
echo "UPTIME_SEC = $(awk '{print $1}' /proc/uptime)" 
echo "IP = $(hostname -I | awk '{print $1}')" 
echo "MASK = $(ifconfig | grep netmask | awk '{print $4}')" 
# echo MASK = $(ip -o -f inet addr show | awk '/scope global/ {print $4}')" 
echo "GATEWAY = $(ip r | grep default | awk '{print $3}')" 
echo "RAM_TOTAL = $(free | grep Mem | awk '{printf "%.3f", $2/1000000}') GB" 
echo "RAM_USED = $(free | grep Mem | awk '{printf "%.3f", $3/1000000}') GB" 
echo "RAM_FREE = $(free | grep Mem | awk '{printf "%.3f", $4/1000000}') GB" 
echo "SPACE_ROOT = $(df /root | grep / | awk '{printf "%2.f", $2/1000}') MB" 
echo "SPACE_ROOT_USED = $(df /root | grep / | awk '{printf "%2.f", $3/1000}') MB" 
echo "SPACE_ROOT_FREE = $(df /root | grep / | awk '{printf "%2.f", $4/1000}') MB" 