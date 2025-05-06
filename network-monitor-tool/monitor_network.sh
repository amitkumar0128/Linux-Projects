#!/bin/bash

source config.cfg

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE="$LOG_DIR/network_log_$(date '+%Y-%m-%d').log"

mkdir -p "$LOG_DIR"

for HOST in $HOSTS; do 
    if ping -c "$PING_COUNT" "$HOST" > /dev/null 2>&1; then
        echo "$TIMESTAMP ✅ $HOST is online" >> "$LOG_FILE"
    else
        echo "$TIMESTAMP ❌ $HOST is offline" >> "$LOG_FILE"
    fi
done