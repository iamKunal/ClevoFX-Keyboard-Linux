#!/bin/bash


while true; do
    OLD_WINDOW=$ACTIVE_WINDOW
    sleep 0.1
    
    ## Get Current Active Window
    ACTIVE_WINDOW=$( cat /proc/$(xdotool getwindowpid $(xdotool getactivewindow))/comm ) 2>/dev/null
    
    if [ "$OLD_WINDOW" = "$ACTIVE_WINDOW" ]; then
        continue
    fi
    
    echo $ACTIVE_WINDOW
done
