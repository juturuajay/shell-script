
#!/bin/bash

MSG="message from script1"
export GREET="greetings from script1"

echo $MSG

# Export the GREET variable so it is available to script2


# Call script2
bash 21-script-2.sh



