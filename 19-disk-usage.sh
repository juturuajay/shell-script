#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real project 80

#PARTITION=$(echo $line | awk -F " " '{print $NF}') add line9
#echo "partition: $PARTITION, Usage: $USAGE" add line10

while read -r line
do
 USAGE=$(echo $line | awk -F " " '{print $6F}') 
done <<< $DISK_USAGE