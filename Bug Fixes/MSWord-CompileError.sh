#!/bin/bash
##################################################################
# MS Word - Complile Error
#
# Fixes issue where MS Word will pop up a compile error on launch.
# This is caused by an older version Adobe Acrobat and should have
# been fixed in an update.
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-April-08

# Removes the problem file
rm ~/Library/Group\ Containers/UBF8T346G9.Office/User\ Content.localized/Startup.localized/Word/linkCreation.dotm
