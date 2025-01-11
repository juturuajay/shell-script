#!/bin/bash

MSG="message from script1"
GREET="greetings from script1"

echo $MSG

# Export the GREET variable so it can be accessed in script2
export GREET

# Call script2
sh 21-script-2.sh
