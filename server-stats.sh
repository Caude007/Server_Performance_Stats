#!/bin/bash

echo " ++++ Get your server stats ++++"

uptime

cat /etc/os-release | grep "VERSION="

echo "============Total CPU usage============"

sudo top  -bn1 | grep '%Cpu(s)' | awk '{print $2 + $3 + $4}'

echo "============Total memory usage==========="

sudo free --total -h | awk 'NR==2 {print "free: " $4 "  Used: " $3 "  ====  " ($3/$2) "%"}'

echo  "==============Total disk Usage=============="
sudo df --total -h | grep 'total' | awk '{print "Size: " $2 " Used: " $3 " Available: " $4 " Used %: " $5 }'

echo "============Top 5 processes by CPU usage==========="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=%cpu | head -n 6

echo "===============Top 5 processes by memory usage============="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=%mem | head -n 6

echo "Thank you...."
