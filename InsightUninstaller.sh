#!/bin/bash

##################################################################
# Faronics Insight Uninstaller
#
# Script to pair with "UninstallInsight.pkg" which contains the Uninstaller App
# in a hidden folder to users. Script then opens the app (which prompts for uninstall)
# then waits 2 minutes to allow the process to finish. Then deletes the Uninstaller App.
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-April-05

#Check to see if Insight is Installed
if [ -d "/Library/Application Support/Faronics/Insight" ]; then

  #Opens the Uninstaller as the current user
  sudo -u $3 open /var/etc/InsightUninstall/Student\ Uninstall.app

  #Wait for 120 seconds
  sleep 120

else

  echo "Insight was not detected"

fi


#Remove the Uninstaller
rm -rf /var/etc/InsightUninstall
rm -rf /Library/Application\ Support/Faronics/Insight
