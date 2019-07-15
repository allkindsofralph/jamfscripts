#!/bin/bash
##################################################################
# Zoom Camera Disable
#
# Disables the default setting of camera on when joining meeting
# to address the zoom exploit.
#
# Must be used with Zoom IT Installer. Will not work with standard version.
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-July-09

# Change Setting for Camera to be off when joining
sudo defaults write /Library/Preferences/us.zoom.config.plist ZDisableVideo 1

# Kills the process of the webserver
pid=$(lsof -i :19421)
kill -9 "$pid"

#Remove the webserver
rm -rf ~/.zoomus
touch ~/.zoomus

#Remove the zoom app
rm -r /Applications/zoom.us
