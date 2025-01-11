#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real project will monitor for 80
MSG="" 

while read -r line
do
 USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1) 
 PARTITION=$(echo $line | awk -F " " '{print $NF}') 
 #echo "partition: $PARTITION, Usage: $USAGE"
 if [ $USAGE -ge $DISK_THRESHOLD ]
 then
   MSG+=" High disk usage on partition: $PARTITION usage is : $USAGE\n " #+= it will not replace any message give output entire
 fi

done <<< $DISK_USAGE

echo -e "Message: $MSG"

echo "$MSG" | mutt -s "High Disk Usage" kumarreddyj007@gmail.com

#  Replace \n with actual newlines for clean output
# FORMATTED_MSG=$(echo -e "$MSG")
# echo -e "Message:\n$FORMATTED_MSG"
# # Sending email
# echo -e "$FORMATTED_MSG" | mutt -s "High Disk Usage" kumarreddyj007@gmail.com