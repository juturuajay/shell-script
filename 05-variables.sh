#!/bin/bash

echo "please enter your username::" #text entered here will be added as value to variable

read USERNAME # Here USERNAME is the variable name  

echo "username entered: $USERNAME"

echo "Please enter your password:"

read -s PASSWORD #-s is used for hidden the password