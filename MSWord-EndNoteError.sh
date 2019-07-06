#!/bin/bash
##################################################################
# MS Word - EndNote CWYW Error
#
# Fixes issue where MS Word will pop up a EndNote error on launch.
# This is caused by an older version EndNote and should have
# been fixed in an update.
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-April-08

# Removes the problem file
sudo rm -r /Library/Application\ Support/Microsoft/Office365/User\ Content.localized/Startup.localized/Word/EndNote\ CWYW\ Word\ 2016.bundle
