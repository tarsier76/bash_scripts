#!/bin/bash

CPU_USAGE="$(top -b -n 2 -d 1 | grep "Cpu(s)" | tail -n 1 | awk -F" " '{print $2}')"
MEM_USAGE="$(free | sed -n "2p" | awk -F" " '{print $3 / $2 * 100}')"
UPTIME="$(uptime | awk -F" " '{print $1}')"
CURRENT_USERS="$(uptime | awk -F" " '{print $5}')"
IP_ADDR="$(ip -br address | sed -n "2p" | awk -F" " '{print $3}')"

echo "Curent CPU usage: ${CPU_USAGE}%"
echo "Current Memory usage: ${MEM_USAGE:0:4}%"
echo "System uptime: ${UPTIME}"
echo "Logged in users: ${CURRENT_USERS}"

echo

echo "This machine's IPv4 Address: $IP_ADDR"
