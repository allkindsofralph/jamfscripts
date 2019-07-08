#!/bin/bash
##################################################################
# Automatic Rename Computer
#
# Script will automatically rename the computer based on model and
# serial number. Customize to your liking as needed.
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-26-June
#
### jamf Parameter Labels ###
# Parameter 4
# Computer Naming Scheme string (variables: $model and $serial are available)

# Get Serial Number
serial=$(system_profiler SPHardwareDataType | grep 'Serial Number (system)' | awk '{print $NF}')

# Get Model Type
model=$(system_profiler SPHardwareDataType | grep 'Model Name' | sed 's/      Model Name: //')

# Shorten the computer model names here
case $model in
	"MacBook Pro") model="mbp";;
	"MacBook Air") model="mba";;
	"Mac mini") model="macmini";;
	"MacBook") model="mb";;
	"iMac") model="imac";;
	"iMac Pro") model="imacpro";;
	"Mac Pro") model="macpro";;
	*) model="unknown"
esac

# Setup default naming scheme here. Optionally you can use Parameter 4 to set it there.
computerName="$3-${model}"

if [[ $4 != "" ]]; then
	computerName="$4"
fi

# Set Computer Name
sudo scutil --set ComputerName "$computerName"
sudo scutil --set LocalHostName "$computerName"
sudo scutil --set HostName "$computerName"
sudo /usr/local/bin/jamf recon

echo
echo "Computer name has been set to: $computerName"
echo
exit 0
