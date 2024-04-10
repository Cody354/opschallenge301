#!/usr/bin/env python3

# Script:                      Ops Challenge: Python Requests Library
# Author:                       cody blahnik
# Date of latest revision:      04/9/2024
# Purpose:                      Install and test requests

import requests

# asks the user for the URL
url = input("Please enter the destination URL: ")

# asks the user for the HTTP method
http_method = input("Please select a HTTP Method (GET, POST, PUT, DELETE, HEAD, PATCH, OPTIONS): ").upper()

# Validate the HTTP method
valid_methods = ["GET", "POST", "PUT", "DELETE", "HEAD", "PATCH", "OPTIONS"]
if http_method not in valid_methods:
    print("Invalid HTTP Method selected.")
else:
    # Print the request details
    print(f"\nYou are about to send a {http_method} request to {url}\n")

    # Confirm before proceeding
    confirm = input("Proceed? (yes/no): ").lower()
    if confirm == "yes":
        try:
            # Perform the request
            response = requests.request(http_method, url)
            
            # Translate status code to plain terms
            status_codes = {
                200: "OK - The request has succeeded.",
                404: "Not Found - The server cannot find the requested resource.",
                500: "Internal Server Error - The server encountered an unexpected condition.",
            }
            
            # Default message if status code is not in the predefined list
            status_message = status_codes.get(response.status_code, f"Status Code: {response.status_code}")

            # Print the status message
            print(f"\nResponse Status: {status_message}\n")

            # Print response header information
            print("Response Headers:")
            for header, value in response.headers.items():
                print(f"{header}: {value}")
        except requests.exceptions.RequestException as e:
            print(f"Request failed: {e}")
    else:
        print("Operation canceled.")
