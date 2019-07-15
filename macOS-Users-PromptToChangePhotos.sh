#!/bin/bash
##################################################################
# Change User Photos
#
# Change User Photos for Corporate Branding
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-03-July
#
# Reference via https://www.jamf.com/jamf-nation/discussions/4332/how-to-change-local-user-account-picture-through-command-terminal#responseChild162438

Copy Files to Desktop
cp /tmp/icons/user.jpg /Users/"${3}"/Desktop
cp /tmp/icons/admin.png /Users/"${3}"/Desktop

sudo -u "$3" osascript -e 'Tell application "System Events" to display dialog "You now have 5 minutes to set the user pictures. Images are on the desktop." buttons {"OK"}'

sleep 300

exit 0
