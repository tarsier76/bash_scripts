#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "This script needs to be run with elevated privileges."
  exit 1
fi

echo "Searching for package updates..."
sudo apt update
echo "Checking available package updates for installed programs..."

echo "$(apt list --upgradeable 2>/dev/null | awk -F "/" '{print $1}' | awk '{printf "%s%s", $1, sep; sep=","} END{print ""}')" 

read -p "The above packages can be updated. Do you want to update them? (y/n) " choice 

case $choice in
  y|ye|yes)
    echo "Installing updates, this may take a while..."
    sudo apt -y full-upgrade &>/dev/null
    echo "Your system has updated successfully."
    ;;
  n|no)
    exit 0
    ;;
  *)
    echo "Not a valid option. Exiting."
    exit 1
esac
	
