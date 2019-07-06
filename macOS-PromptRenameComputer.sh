#!/bin/bash
##################################################################
# Prompt Rename Computer
#
# Script to make a Finder Prompt to rename the computer.
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-April-05

# Get User to input name
while true
sudo -u $3 do
name=$(osascript -e 'Tell application "System Events" to display dialog "Please enter a name for your computer" default answer ""' -e 'text returned of result' 2>/dev/null)
    if [ $? -ne 0 ]
    then # user cancel
        exit
    elif [ -z "$name" ]
    then # loop until input or cancel
        osascript -e 'Tell application "System Events" to display alert "Please enter a name or select Cancel!" as warning'
    else [ -n "$name" ] # user input
        break
    fi
done

#Set computer name based on user Input
sudo scutil --set ComputerName $name
sudo scutil --set LocalHostName $name
sudo scutil --set HostName $name
sudo /usr/local/bin/jamf recon
