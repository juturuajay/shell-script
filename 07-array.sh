#!/bin/bash

NAME=("AJAY","KUMAR","REDDY") #index starts from 0 and size of array NAME is 3

echo "first name: ${NAME[0]}"
echo "middle name: ${NAME[1]}"
echo "last name: ${NAME[2]}"

echo "full name: ${NAME[@]}"