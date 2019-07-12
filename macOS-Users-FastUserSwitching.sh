#!/bin/bash
##################################################################
# Enable Fast User Switching
#
# Script to enable Fast User Switching so that an admin is able to
# sign in to a computer if a user is not present but still logged in
# to the computer.
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-April-10

defaults write /Library/Preferences/.GlobalPreferences.plist MultipleSessionEnabled -bool true

# Setting for Login Window Display As:
# True: Username and Password; False: List of Users
defaults write /Library/Preferences/com.apple.loginwindow.plist SHOWFULLNAME -bool false

echo
echo "Fast User Switching is now enabled."
echo
