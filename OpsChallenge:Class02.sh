#!/bin/bash

# Script Name:                  Ops Challenge Append; Date and Time
# Author:                       Cody Blahnik
# Date of latest revision:      3/26/24
# Purpose:                      copys /var/log/syslog and appends time



#copy sylogs and appends the time and date
cp /var/log/syslog "syslog_$(date '+%Y-%m-%d_%H-%M-%S')"
