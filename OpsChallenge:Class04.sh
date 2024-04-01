#!/bin/bash

# Script Name:                  Ops Challenge: Conditionals in Menu Systems
# Author:                       Cody Blahnik
# Date of latest revision:      3/26/24
# Purpose:                      bash script that launches a menu system 


# Create a bash script that launches a menu system with the following options:
# Hello world (prints “Hello world!” to the screen)
# Ping self (pings this computer’s loopback address)
# IP info (print the network adapter information for this computer)
while true; do
    echo "Menu:"
    echo "1. Hello world"
    echo "2. Ping self"
    echo "3. IP info"
    echo "4. Exit"
    echo -n "Please select an option: "

# Exit
# Next, the user input should be requested.
    read -p "Please select an option: " option
#The program should next use a conditional statement to evaluate the user’s input, then act according to what the user selected.
if [ "$option" == "1" ]; then
        echo "Hello world!"
    elif [ "$option" == "2" ]; then
        ping 127.0.0.1  # Ping the loopback address
    elif [ "$option" == "3" ]; then
        ifconfig  # Display network adapter information
    elif [ "$option" == "4" ]; then
        echo "Exiting..."
        exit 0
    else
        echo "Invalid option. Please select again."
    fi
#Use a loop to bring up the menu again after the request has been executed.
    read -p "Press Enter to continue or type 'exit' to quit: " choice
    if [ "$choice" == "exit" ]; then
        echo "Exiting..."
        exit 0
    fi

done