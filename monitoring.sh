#!/bin/bash

#Variables
ARCHITECTURE=$(uname -a)
CPU_PHYSICAL=$(grep "physical id" /proc/cpuinfo | wc -l)
V_CPU=$(grep processor /proc/cpuinfo | wc -l)
RAM_USED_MEM=$(free --mega | awk '$1 == "Mem:" {print $3}')
RAM_TOTAL_MEM=$(free --mega | awk '$1 == "Mem:" {print $2}')
RAM_USAGE_PERCENTAGE=$(free --mega | awk '$1 == "Mem:" {printf("(%.2f%%)\n), $3/$2*100}')
MEMORY_USED=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_use += $3} END {print memory_use}')
TOTAL_MEMORY=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_result += $2} END {printf ("%.0fGb\n"), memory_result/1024}')
MEMORY_USAGE_PERCENTAGE=$(df -m | grep "/dev/" | grep -v "/boot" awk '{use += $3} {total += $2} END {printf("(%d%%)\n"), use/total*100}')
CPU_LOAD=$(vmstat 1 3| tail -1 | awk '{print $15}')

#Calculations
CPU_OP=$(expr 100 - $CPU_LOAD)
CPU_LOAD_PERCENTAGE=$(printf ")
#To print out
wall"
Broadcast message from root@apeposhi
Architecture: $ARCHITECTUER
CPU physical: $CPU_PHYSICAL
vCPU: $V_CPU
Memory Usage: $RAM_USED_MEM/$RAM_TOTAL_MEM $RAM_USAGE_PERCENTAGE
Disk Usage: $MEMORY_USED/$TOTAL_MEMORY $MEMORY_USAGE_PERCENTAGE
CPU Load: $CPU_LOAD_PERCENTAGE%
Last boot:
LVM use:
Connections TCP:
User log:
Network:
Sudo: 
"