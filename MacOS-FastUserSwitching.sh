#!/bin/bash
##################################################################
# Enable Fast User Switching
#
# Enables multi user logins by turning on Fast User Switching
#
# Ralph Casafrancisco
# casafrancisco@chapman.edu
# 2019-10-April

defaults write /Library/Preferences/.GlobalPreferences.plist MultipleSessionEnabled -bool true
defaults write /Library/Preferences/com.apple.loginwindow.plist SHOWFULLNAME -bool true
