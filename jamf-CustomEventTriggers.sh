#!/bin/bash
##################################################################
# Custom Event Triggers
#
# This is a simple script that allows you to use Script parameters
# to trigger a custom event. If you set custom event triggers in
# your policies, you can trigger them via this script.
#
# The script checks each parameter to see if it is not blank, if
# the parameter has a value it will trigger the policy.
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-March-14

if [ "$4" != "" ];then
	sudo jamf policy -trigger "$4"
fi

if [ "$5" != "" ];then
	sudo jamf policy -trigger "$5"
fi

if [ "$6" != "" ];then
	sudo jamf policy -trigger "$6"
fi

if [ "$7" != "" ];then
	sudo jamf policy -trigger "$7"
fi

if [ "$8" != "" ];then
	sudo jamf policy -trigger "$8"
fi

if [ "$9" != "" ];then
	sudo jamf policy -trigger "$9"
fi

if [ "${10}" != "" ];then
	sudo jamf policy -trigger "${10}"
fi

if [ "${11}" != "" ];then
	sudo jamf policy -trigger "${11}"
fi
