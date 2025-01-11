#!/bin/bash

MSG="message from script1"
GREET="greetings from script1"

export GREET
echo $MSG

sh 21-script-2.sh
