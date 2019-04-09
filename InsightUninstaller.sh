#!/bin/bash

##################################################################
# Faronics Insight Uninstaller
#
# Script to pair with "UninstallInsight.pkg" which contains the Uninstaller App
# in a hidden folder to users. Script then opens the app (which prompts for uninstall)
# then waits 2 minutes to allow the process to finish. Then deletes the Uninstaller App.
#
# Ralph Casafrancisco
# casafrancisco@chapman.edu
# 2019-05-April

#Check to see if Insight is Installed
if [ -d "/Library/Application Support/Faronics/Insight" ]; then

  #Opens the Uninstaller as the current user
  sudo open /var/etc/InsightUninstall/Student\ Uninstall.app
    
  #Wait for 30 seconds
  sleep 30
  
else
  
  echo "Insight was not detected"

fi


#Remove the Uninstaller
rm -rf /var/etc/InsightUninstall
rm -rf /Library/Application\ Support/Faronics/Insight
