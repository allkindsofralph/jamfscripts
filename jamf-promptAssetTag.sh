#!/bin/bash
##################################################################
# Asset Tag Entry
#
# Ask User for Asset Tag
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-24-June

#Prompt for Asset Tag
assetTag=$(sudo -u "$3" osascript -e 'Tell application "System Events" to display dialog "Please enter the Asset Tag:" default answer ""' -e 'text returned of result' 2>/dev/null)
sleep 15s

#Set Asset Tag in jamf
if [[ $assetTag != "" ]]; then
  sudo jamf recon -assetTag "${assetTag}" -endUsername "$3"
  echo
  echo "Asset Tag has been submitted as $assetTag to jamf"
  echo
  exit 0
else
  echo
  echo "No Asset Tag was entered"
  echo
  exit 0
fi
