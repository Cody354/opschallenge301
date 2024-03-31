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
timestamp=$(date +"%Y%m%d%H%M%S")

# Loop through each log file and perform actions
for file in "${LOG_FILES[@]}"; do
    # make sure the log file exists
    if [ -f "$file" ]; then
        # Print file size before compression
        file_size=$(wc -c <"$file")
        echo "Size of $file before compression: $file_size bytes"

        # Compress the file
        gzip -c "$file" > "$BACKUP_DIR/$(basename "$file")-$TIMESTAMP.gz"

        # Clear the contents of the log file
        >"$file"
        echo "Cleared the contents of $file"

        # Get the compressed file size
        compressed_file_path="$BACKUP_DIR/$(basename "$file")-$timestamp.gz"
        compressed_filesize=$(wc -c <"$compressed_file_path")
        echo "Size of compressed file: $compressed_filesize bytes"

        # Compare the original and compressed file sizes
        if [ $file_size -gt $compressed_filesize ]; then
            echo "Compression was successful: Original size is greater than compressed size."
        else
            echo "Compression failed or had no effect: Compressed size is not smaller than original size."
        fi
    else
        echo "Error: File $file does not exist."
    fi
done