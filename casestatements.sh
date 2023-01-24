#! /bin/bash
<<COMMENTS
create startup script for application called sleepwalking-server provided
script should be named sleepwalking and accept "start" and "stop" as arguments
if anything other than "start" or "stop" is provided as argument display usage
statement: "Usage sleepwalking start|stop" and terminate script with exit status
1
to start sleepwalkingserver use "/tmp/sleep-walkingserver" & to stop
"kill $(cat/tmp/sleepwalkingserver.pid)"
-give bash script for sleepwalkingserver
-put file in /tmp and run chmod 755 /tmp/sleepwalkingserver
COMMENTS

case "$1" in
    start )
        /tmp/sleep-walkingserver
        ;;
    stop )
        kill $(cat/tmp/sleepwalkingserver.pid)
        ;;
    *) echo "Usage sleepwalking start|stop"
        exit 1
esac 
