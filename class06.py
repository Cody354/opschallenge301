#!/usr/bin/env python3

# Script Name:                  Ops Challenge: 06
# Author:                       Cody Blahnik
# Date of latest revision:      4/1/24
# Purpose:                      Python script that executes a few bash commands successfully. Indicate in comments how you achieved this.


# The Python module “os” must be utilized.
# At least three variables must be declared and referenced in Python.
# The Python function print() must be used at least three times.
#whoami
# ip a
# lshw -short
# The Python module “os” must be utilized.
# import os
import os

# declaring 3 variables
list = os.system("ls")
user = os.system("whoami")
hardware = os.system("lshw -short")

# make a funnction
print(list)
print(user)
print(hardware)