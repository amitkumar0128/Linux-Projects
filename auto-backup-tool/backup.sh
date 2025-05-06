#!/bin/bash

#Load configuration
source backup_config.cfg

DATE=$(date +%F_%T)
BACKUP_NAME="backup_$DATE"
TMP_DIR="/tmp/$BACKUP_NAME"

mkdir -p "$TMP_DIR"

# Split SOURCE_DIRS string into array
IFS=' ' read -ra DIRS <<< "$SOURCE_DIRS"

for DIR in "${DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    cp -r "$DIR" "$TMP_DIR"
  else
    echo "❌ Directory $DIR does not exist. Skipping."
  fi
done


if [ "$COMPRESS" == "yes" ]; then
    tar -czf "$DEST_DIR/$BACKUP_NAME.tar.gz" -C /tmp "$BACKUP_NAME"
    echo "$DATE - Backup copied to $DEST_DIR/$BACKUP_NAME/" >> "$LOG_FILE"
fi

# Cleanup
rm -rf "$TMP_DIR"

echo "✅ Backup completed at $DATE"
