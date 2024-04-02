#!/usr/bin/env python3

# Script Name:                  Ops Challenge: 07
# Author:                       Cody Blahnik
# Date of latest revision:      4/2/24
# Purpose:                      Directory Creation

# Import libraries
import os

# Declaration of variables
user_directory = input("What directory path would you like: ")

# Declaration of functions
def create_directory(directory):
    for (root, dirs, files) in os.walk(directory):
         ### Add a print command here to print ==root==
         print("==root==")
         print(root)
          ### Add a print command here to print ==dirs==
         print("==dirs==")
         print(dirs)
         ### Add a print command here to print ==files==
         print("==files==")
         print(files)

# Main
create_directory(user_directory)
# End
