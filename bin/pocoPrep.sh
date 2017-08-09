#!/bin/bash
# shellcheck disable=SC2154
# this script contains:
## idempotent functions to define if Poco library has to be compiled
## Installation of requirements for Poco build only
## Download & install Poco Sources
if [ ! -d $poco_dir ]; then
  #Fix for poco_version being unset after Lo compilation? TODO: Check the case
  [ -z "${poco_version}" ] && poco_version=$(curl -s https://pocoproject.org/ | awk -F'The latest stable release is ' '{printf $2}' | grep -Eo '^[^ ]+.\w')
  wget -c https://pocoproject.org/releases/poco-${poco_version_folder}/poco-${poco_version}-all.tar.gz -P "$(dirname $poco_dir)"/ || exit 3
  tar xf "$(dirname $poco_dir)"/poco-${poco_version}-all.tar.gz -C  "$(dirname $poco_dir)"/
  chown lool:lool $poco_dir -R
fi
