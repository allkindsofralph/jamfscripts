#!/bin/bash
##################################################################
# Set Department using Menu
#
# Prompts user with  a list of departments to select from. Then
# submits that department to be stored in jamf.
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-July-07

# Set Departments here as strings separated by comma
# ie. ("Department 1", "Department 2", "etc")
# If not hard coded in here, you can use Parameter $4 in jamf scripts
departmentList='"Accounting", "Compliance", "Data Science", "DevOps", "Engineering", "Executive Team", "Human Resources", "Marketing", "Member Experience", "Member Experience Managers", "Product", "QA", "Risk", "Not Listed"'

if [[ $departmentList = "" && $4 = "" ]]; then
  echo
  echo "Error, no departments found"
  echo
  exit 1
elif [[ $4 != "" ]]; then
  departmentList="$4"
  echo
  echo "Department information taken from Parameter 4"
  echo
else
  echo
  echo "Using hard-coded departments"
  echo
fi

dpt=$(sudo -u "$3" osascript -e 'tell application "System Events" to (choose from list {'"$departmentList"'} with prompt "Please select your Department:")')

# Send Department selection to jamf
sudo jamf recon -department \""$dpt"\"
echo
echo "Department has been set as $dpt"
echo
exit 0
