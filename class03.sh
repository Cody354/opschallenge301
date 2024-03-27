#!/bin/bash

# Script Name:                 Ops Challenge: File Permissions
# Author:                      Cody Blahnik
# Date of latest revision:     3/27/24
# Purpose:                     Create a bash script that alters file permissions of everything in a directory.

# Prompts user for input directory path.
read -p "What directory path do you want to use? " dire

# Prompts user for input permissions number (e.g. 777 to perform a chmod 777)
read -p "Input permissions number (e.g. 777 to perform a chmod 777): " per

# Navigates to the directory input by the user and changes all files inside it to the input setting.
cd "$dire" && chmod -R "$per" .

# Prints to the screen the directory contents and the new permissions settings of everything in the directory.
echo "Directory contents and the new permissions settings of everything in the directory:"
ls -l "$dire"

