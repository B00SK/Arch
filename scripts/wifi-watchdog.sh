#!/bin/bash
INTERFACE="wlp3s0"
THRESHOLD=300
CHECK_INTERVAL=12
BAD_COUNT=0
BAD_LIMIT=2

while true; do
    sleep $CHECK_INTERVAL
    
    PING=$(ping -c 2 -W 2 8.8.8.8 2>/dev/null | tail -1 | awk -F '/' '{print $5}' | cut -d'.' -f1)
    
    if [ -z "$PING" ] || [ "$PING" -gt "$THRESHOLD" ]; then
        BAD_COUNT=$((BAD_COUNT + 1))
        
        if [ "$BAD_COUNT" -ge "$BAD_LIMIT" ]; then
            nmcli device disconnect $INTERFACE > /dev/null 2>&1
            sleep 2
            nmcli device connect $INTERFACE > /dev/null 2>&1
            BAD_COUNT=0
        fi
    else
        BAD_COUNT=0
    fi
done
