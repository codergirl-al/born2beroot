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
LAST_BOOT=$(who -b | awk '$1 == "system" {print $3 " " $4}')
LVM_USAGE=$(if [ $lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)
TCP_CONNECTIONS=$(ss -a | grep ESTAB | wc -l)
USERS_LOG=$(users | wc -w)
IP=$(hostname -I)
MAC=$(ip link | grep "link/ether" | awk '{print $2}')
SUDO=$(journalctl _COMM=sudo | grep COMMAND | wc -l)
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
Last boot: $LAST_BOOT
LVM use: $LVM_USAGE
Connections TCP: $TCP_CONNECTIONS
User log: $USERS_LOG
Network: IP $IP ($MAC)
Sudo: $SUDO cmd
"