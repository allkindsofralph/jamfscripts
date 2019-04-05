##################################################################
# Faronics Insight Uninstaller
#
# Script to pair with "Insight Uninstaller.pkg" which copies the Uninstaller App
# to a hidden folder to users. Script then opens the app (which prompts for uninstall)
# then waits 2 minutes to allow the process to finish. Then deletes the Uninstaller App.
#
# Ralph Casafrancisco
# casafrancisco@chapman.edu
# 2019-05-April

#Opens the Uninstaller as the current user
sudo -u $3 open /var/etc/InsightUninstall/Student\ Uninstall.app

#Wait for 120 seconds
sleep 120

#Remove the Uninstaller
cd /var/etc/
rm -rf InsightUninstall
