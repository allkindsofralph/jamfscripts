#!/bin/bash
##################################################################
# Extension Attribute - Does File Exist
#
# Checks if a file exists and assigns a String to an EA
#
# Ralph Casafrancisco
# casafrancisco@chapman.edu
# 2019-22-April

# Place file name here
FILE=/tmp/unenroll/ready.txt    

# Check if file Exists
if [ -f $FILE ]; then
   echo "<result>True</result>"
else
   echo "<result>False</result>"
fi
