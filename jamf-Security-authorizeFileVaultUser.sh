#!/bin/bash
##################################################################
# Authorize Users for FileVault 2
#
# Adds the admin and management accounts to allow FileVault decryption
#
# Requires macOS 10.14.2
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-24-June
#
### jamf Parameter Labels ###
# Parameter 4
# Password for main user
#
# Parameter 5
# Name of user to Add to FileVault
#
# Parameter 6
# Password of user to Add to FileVault

defaultPW="password_is_weak"
adminUser="jamf"
adminPW="i_feel_the_Power"

# Check if Parameters are used instead
if [[ $4 != "" ]]; then
  defaultPW="$4"
  echo
  echo "Parameter 4 used for admin password"
  echo
fi
if [[ $5 != "" ]]; then
  adminUser="$5"
  echo
  echo "Parameter 5 used for admin username"
  echo
fi
if [[ $6 != "" ]]; then
  adminPW="$6"
  echo
  echo "Parameter 6 used for admin password"
  echo
fi

#Check status of Secure Token
adminTokenStatus=$(sysadminctl -secureTokenStatus "$adminUser" 2>&1 | awk '{print$7}')

if [[ $adminTokenStatus != "DISABLED" && $adminTokenStatus != "ENABLED" ]]; then
  echo
  echo "An error occured, please check your username/password combination"
  echo
  exit 1
fi

# Runs command to authorize the other users to FileVault
if [[ $adminTokenStatus = "DISABLED" ]]; then
  sudo -u "$3" sysadminctl -adminUser "$3" -adminPassword "$defaultPW" -secureTokenOn "$adminUser" -password "$adminPW"
  echo "Secure Token granted to user: $adminUser"
else
  echo "Secure Token already granted for user: $adminUser or user does not exist"
fi

exit 0
