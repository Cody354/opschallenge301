#!/bin/bash

# Script Name:                  Ops Challenge: 05
# Author:                       Cody Blahnik
# Date of latest revision:      3/31/24
# Purpose:                      Write a log clearing bash script.


# Define the backup directory within /var/log and create it if it doesn't exist
mkdir backups
BACKUP_DIR="backups"


# Define the log files to be compressed and cleared
LOG_FILES=("/var/log/syslog" "/var/log/wtmp") 

# Generate a timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Loop through each log file and perform actions
for file in "${LOG_FILES[@]}"; do
    # make sure the log file exists
    if [ -f "$file" ]; then
        # Print file size before compression
        FILE_SIZE=$(wc -c <"$file")
        echo "Size of $file before compression: $FILE_SIZE bytes"

        # Compress the file
        gzip -c "$file" > "$BACKUP_DIR/$(basename "$file")-$TIMESTAMP.gz"

        # Clear the contents of the log file
        >"$file"
        echo "Cleared the contents of $file"

        # Get the compressed file size
        COMPRESSED_FILE_PATH="$BACKUP_DIR/$(basename "$file")-$TIMESTAMP.gz"
        COMPRESSED_FILESIZE=$(wc -c <"$COMPRESSED_FILE_PATH")
        echo "Size of compressed file: $COMPRESSED_FILESIZE bytes"

        # Compare the original and compressed file sizes
        if [ $FILE_SIZE -gt $COMPRESSED_FILESIZE ]; then
            echo "Compression was successful: Original size is greater than compressed size."
        else
            echo "Compression failed or had no effect: Compressed size is not smaller than original size."
        fi
    else
        echo "Error: File $file does not exist."
    fi
done