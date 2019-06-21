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
# 2019-10-April

defaults write /Library/Preferences/.GlobalPreferences.plist MultipleSessionEnabled -bool true
defaults write /Library/Preferences/com.apple.loginwindow.plist SHOWFULLNAME -bool true
