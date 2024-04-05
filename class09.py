#!/usr/bin/env python3

# Script Name:                  Ops Challenge: 08
# Author:                       Cody Blahnik
# Date of latest revision:      4/5/24
# Purpose:                      Python Conditional Statements

# conditional for a=b
a = 5
b = 5

if a == b:
    print("a is equal to b")

# conditional for comparing less than by the <
if a < b:
    print("a is less than b")

# this is for not equal to or also greaterthan
if a != b:
    print("a is not equal to b")
elif a > b:
    print("a is greater than b")

# this use the elif and else for less than or greater tha or equal to
if a < b:
    print("a is less than b")
elif a > b:
    print("a is greater than b")
else:
    print("a is equal to b")
