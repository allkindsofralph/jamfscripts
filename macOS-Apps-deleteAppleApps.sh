#!/bin/bash
##################################################################
# Remove Apple Software
#
# Delete Apple Software for cleaning up the computer before deployment
#
# Ralph Casafrancisco
# http://github.com/allkindsofralph
# 2019-9-May

# Remove iWork
if [ -d Applications/Keynote.app ]
then
  sudo rm -R /Applications/Keynote.app
  echo
  echo "Keynote was removed."
  echo
fi
if [ -d Applications/Numbers.app ]
then
  sudo rm -R /Applications/Numbers.app
  echo
  echo "Numbers was removed."
  echo
fi
if [ -d Applications/Pages.app ]
then
  sudo rm -R /Applications/Pages.app
  echo
  echo "Pages was removed."
  echo
fi

# Remove GarageBand
if [ -d Applications/GarageBand.app ]
then
  sudo rm -R /Applications/GarageBand.app
  echo
  echo "GarageBand was removed."
  echo
fi

# Remove iMovie
if [ -d Applications/iMovie.app ]
then
  sudo rm -R /Applications/iMovie.app
  echo
  echo "iMovie was removed."
  echo
fi

echo
echo "Apple Apps have been removed successfully, or were already deleted previously."
echo

exit 0
