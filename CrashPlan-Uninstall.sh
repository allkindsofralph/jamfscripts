#!/bin/bash
##################################################################
# Uninstall CrashPlan
#
# Launches the CrashPlan Uninstaller
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-April-05

#Check to see if CrashPlan Uninstaller is present
if [ -f "/Library/Application Support/CrashPlan.app" ]; then

  #Opens the Uninstaller as the current user
  sudo -u $3 open /Library/Application\ Support/CrashPlan.app
fi
