#!/bin/bash

NUMBER1=$1

if [ $NUMBER1 -lt 100 ] #-gt -lt -eq -ge -le
then 
 echo "Given number is greater than 100"
else
 echo "Given number is less than or equal to 100"
fi