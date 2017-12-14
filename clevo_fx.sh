#!/bin/bash

HOME='/home/kunal'

CLEVO_HOME=$HOME/.clevo-config

SYS_KB_PATH='/sys/devices/platform/clevo_xsm_wmi/kb_color'


while true; do
    OLD_WINDOW=$ACTIVE_WINDOW
    sleep 0.1
    
    ## Get Current Active Window
    ACTIVE_WINDOW=$( cat /proc/$(xdotool getwindowpid $(xdotool getactivewindow))/comm ) 2>/dev/null
    
    if [ "$OLD_WINDOW" = "$ACTIVE_WINDOW" ]; then
        continue
    fi
    
    echo $ACTIVE_WINDOW
     
    KB_COLOR=$( xmlstarlet sel -t -v "/app-list/default/kb_color" $CLEVO_HOME/config.xml )
#    xmlstarlet sel -t -v "/app-list/application[window/@name='$ACTIVE_WINDOW']/kb_color" config.xml
    
    present=$(xmlstarlet sel -t -v "/app-list/application[window/@name='$ACTIVE_WINDOW']/kb_color" $CLEVO_HOME/config.xml)
    
#    echo $present
    if  [ $( echo -n $present | wc -c) -ne 0 ]; then
        KB_COLOR=$present
    fi
#    echo $KB_COLOR
    if [ ! -f $CLEVO_HOME/kb_current ]; then
        echo -n $KB_COLOR > $CLEVO_HOME/kb_current
    fi
    OLD_KB_COLOR=$CLEVO_HOME/kb_current
    if [ "$OLD_KB_COLOR" != "$KB_COLOR" ] ; then
        echo -n $KB_COLOR > $CLEVO_HOME/kb_current
    fi
    
    cat $CLEVO_HOME/kb_current > $SYS_KB_PATH
    
#    #for i in $(xmlstarlet sel -t -v "/option-list/option/username/@value" config.xml); do
#    #    echo "HEY $i";
#    #    done



#    ACTIVE_WINDOW=$( basename $( cat /proc/$(xdotool getwindowpid $(xdotool getactivewindow))/cmdline ) 2>/dev/null )
#    echo $ACTIVE_WINDOW
done
