#!/bin/bash
##################################################################
# Install All Updates
#
# Script to initiate all available updates
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-July-12

# Get all updates
softwareupdate -i -a

echo
echo "Software has been updated"
echo
