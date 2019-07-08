#!/bin/bash
##################################################################
# Reimaging Prep
#
# Script will clear out policy logs, set the computer Department
# to "Server Room Inventory", and clear out the Username of the
# device.
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-26-June
#
### jamf Parameter Labels ###
# Parameter 4
# Room to set in Inventory
#
# Parameter 5
# Department to set in Inventory
#
# Parameter 6
# String to build out computer name ($serial and $model are available to use)

# Set room and department you want the inventory to be listed under
room=""
department=""

# Check parameters if they are being used for data entry
if [[ $4 != "" ]]; then
	room="$4"
fi
if [[ $5 != "" ]]; then
	department="$5"
fi

jamf flushPolicyHistory
sudo jamf recon -endUsername "" -realname "" -email "" -position "" -room \""$room"\" -department \""$department"\"

# Get Serial Number
serial=$(system_profiler SPHardwareDataType | grep 'Serial Number (system)' | awk '{print $NF}')

# Get Model Type
model=$(system_profiler SPHardwareDataType | grep 'Model Name' | sed 's/      Model Name: //')

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

# Build Computer Name string
computerName="${model} ${serial}"

if [[ $6 != "" ]]; then
	computerName="$6"
fi

# Set Computer Name
sudo scutil --set ComputerName "$computerName"
sudo scutil --set LocalHostName "$computerName"
sudo scutil --set HostName "$computerName"
sudo /usr/local/bin/jamf recon
