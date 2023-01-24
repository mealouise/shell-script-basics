#! /bin/bash
<<COMMENTS
write script that displays one random number to the screen and also generates
a syslog message with that random number
use the "user" facility and "info" facility for your message
hint use $RANDOM
COMMENTS

#echo "random number is" $RANDOM
#logger -p user.info "$RANDOM"


# echo "$MESSAGE"
#logger -p -s user.info "$RANDOM"

logger -p local0.info "message"

<<COMMENTS
modify the previous script so it uses a logging function
additionally tag each syslog message with "randomly" and include process ID
generate 3 random numbers
COMMENTS

# logit() {
    #logger -i -t randomly
# }

