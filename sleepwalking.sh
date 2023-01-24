#! /bin/bash
case "$1" in
    start )
        /tmp/sleepwalkingserver.sh
        ;;
    stop )
        kill $(cat/tmp/sleepwalkingserver.pid)
        ;;
    *) echo "Usage sleepwalking start|stop"
        exit 1
esac 