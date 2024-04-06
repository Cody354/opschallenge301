#!/usr/bin/env python3

# Script Name:                  Ops Challenge: 08
# Author:                       Cody Blahnik
# Date of latest revision:      4/5/24
# Purpose:                      Python File Handling

# Create a new .txt file and add three lines of text
with open("example.txt") as file:
    file.write("This is line 1\n")
    file.write("This is line 2\n")
    file.write("This is line 3\n")

# Open the file to read its contents
with open("example.txt", "r") as file:
    # Read the first line and display it on the screen
    first_line = file.readline()
    print("First line of the file:")
    print(first_line)

# Delete the created .txt file
import os
os.remove("example.txt")
