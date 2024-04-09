#!/usr/bin/env python3

# Script Name:                  Ops Challenge: 11
# Author:                       Cody Blahnik
# Date of latest revision:      4/8/24
# Purpose:                      Create a Python script that fetches this information using Psutil

# Importing psutil stuff
import psutil
#Time spent by normal processes executing in user mode
print(f"CPU Time: {psutil.cpu_times().user}")
#Time spent by processes executing in kernel mode #Time when system was idle

print(f"System Idle:{psutil.cpu_times().idle}")


#Time spent by priority processes executing in user mode
print(f"Priority Processes:{psutil.cpu_times().nice}")
#Time spent waiting for I/O to complete.
print(f"I/O Wait Time:{psutil.cpu_times().iowait}")
#Time spent for servicing hardware interrupts
print(f"Servicing Hardware Interrupts:{psutil.cpu_times().irq}")
#Time spent for servicing software interrupts
print(f"Servicing Software interrupts:{psutil.cpu_times().softirq}")
#Time spent by other operating systems running in a virtualized environment
print(f"Other operating systems:{psutil.cpu_times().steal}")
#Time spent running a virtual CPU for guest operating systems under the control of the Linux kernel
print(f"Virtual CPU For Guests:{psutil.cpu_times().guest}")