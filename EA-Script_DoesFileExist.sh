#!/bin/bash
##################################################################
# Extension Attribute - Does File Exist
#
# Checks if a file exists and assigns a String to an EA
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-April-22

# Place file name here
FILE=/tmp/unenroll/ready.txt

# Check if file Exists
if [ -f $FILE ]; then
   echo "<result>True</result>"
else
   echo "<result>False</result>"
fi
