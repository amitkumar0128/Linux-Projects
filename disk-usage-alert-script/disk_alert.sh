#!/bin/bash

# Default threshold value 80%
THRESHOLD=${1:-80}

# Get disk usage for all partitions
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 " " $6 }' | while read output; do
  usep=$(echo $output | awk '{ print $1 }' | tr -d '%')
  partition=$(echo $output | awk '{ print $2 }')
  mountpoint=$(echo $output | awk '{ print $3 }')
  
  if [ "$usep" -ge "$THRESHOLD" ]; then
    echo "⚠️ WARNING: $partition at $mountpoint is ${usep}% full."
    # Optional: logger "Disk usage alert: $partition at $mountpoint is ${usep}% full"
    # Optional: mail -s "Disk Alert" you@example.com <<< "$partition at $mountpoint is ${usep}% full"
  fi
done
