#!/usr/bin/env python3

# Script:                      Ops Challenge: Python Requests Library
# Author:                       cody blahnik
# Date of latest revision:      04/9/2024
# Purpose:                      Install and test requests

Here's the Python script that fulfills your requirements:

Python
import requests

def get_user_input(message):
  """Prompts the user for input and returns the sanitized string."""
  while True:
    user_input = input(message).strip()
    if user_input:
      return user_input
    else:
      print("Invalid input. Please enter a value.")

def get_http_method():
  """Prompts the user to select an HTTP method and returns it."""
  valid_methods = ["GET", "POST", "PUT", "DELETE", "HEAD", "PATCH", "OPTIONS"]
  while True:
    print("Select HTTP Method:")
    for i, method in enumerate(valid_methods):
      print(f"{i+1}. {method}")
    user_choice = input("Enter your choice (1-7): ")
    try:
      choice = int(user_choice) - 1
      if 0 <= choice < len(valid_methods):
        return valid_methods[choice]
      else:
        print("Invalid choice. Please enter a number between 1 and 7.")
    except ValueError:
      print("Invalid choice. Please enter a number.")

def print_request_summary(url, method):
  """Prints the request summary and prompts for confirmation."""
  print(f"Sending request with method: {method}")
  print(f"URL: {url}")
  confirmation = input("Confirm request? (y/n): ")
  return confirmation.lower() == "y"

def translate_status_code(code):
  """Translates common HTTP status codes to plain English."""
  status_codes = {
      200: "OK",
      201: "Created",
      204: "No Content",
      400: "Bad Request",
      401: "Unauthorized",
      403: "Forbidden",
      404: "Not Found",
      500: "Internal Server Error"
  }
  return status_codes.get(code, f"Unknown Status Code: {code}")

def main():
  url = get_user_input("Enter destination URL: ")
  method = get_http_method()
  if print_request_summary(url, method):
    try:
      response = requests.request(method, url)
      print(f"Status Code: {response.status_code} ({translate_status_code(response.status_code)})")
      print("Headers:")
      for key, value in response.headers.items():
        print(f"{key}: {value}")
      print("\nResponse Content:")
      # Consider content size and potential security implications before printing the entire response
      print(response.text[:100] + ("..." if len(response.text) > 100 else ""))
    except requests.exceptions.RequestException as e:
      print(f"Error: {e}")

if __name__ == "__main__":
  main()

