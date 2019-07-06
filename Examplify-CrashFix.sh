#!/bin/bash
##################################################################
# Examplify Crash Fix
#
# Fixes issues after a Examplify crash or incorrect shut down
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-April-08

# Deletes Plist that prevents Desktop items to be seen
sudo -u $3 rm ~/Library/Preferences/com.apple.finder.plist

# Deletes Plist that prevents Screen Shots
sudo -u $3 rm ~/Library/Preferences/com.apple.screencapture.plist

# Tell user that they have 2 minutes before a restart is triggered
say "You now have 2 minutes to save any documents before a restart is needed"
sleep 2m
reboot
