#!/bin/bash
##################################################################
# Remove Dock Recents
#
# Turn off default of Recents in Dock
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-24-June

# Change Setting to don’t show recent applications in Dock
sudo -u "$3" defaults write com.apple.dock show-recents -bool false

# Respring Dock for change to take affect
killall "Dock"

echo
echo "Recent Applications is now disabled from the Dock."
echo
