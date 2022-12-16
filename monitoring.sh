#!/bin/bash

RAM_USED_MEM=$(free --mega | awk '$1 == "Mem:" {print $3}')
RAM_TOTAL_MEM=$(free --mega | awk '$1 == "Mem:" {print $2}')
RAM_USAGE_PERCENTAGE=RAM_USED_MEM/RAM_TOTAL_MEM*100


wall"
Broadcast message from root@apeposhi
Architecture: $(uname -a)
CPU physical: $(grep "physical id" /proc/cpuinfo | wc -l)
vCPU: $(grep processor /proc/cpuinfo | wc -l)
Memory Usage: $(RAM_USED_MEM)/$(RAM_TOTAL_MEM) ($(RAM_USAGE_PERCENTAGE))
Disk Usage:
"