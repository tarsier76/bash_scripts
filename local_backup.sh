#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "The script needs to be run with elevated privilleges. Exiting."
  exit 1
fi

echo -e "Choose one of the following options: \n1.Backup a home directory.\n2.Backup all log files on the system.\n3.Backup a specific folder in the system."
read -r user_choice

case $user_choice in  1)
    read -p "Enter the username for the home directory you want to backup: " user_name
    read -p "Enter the destination directory for the backup: " destination_dir


    if [ -d /home/$user_name ] && [ -d $destination_dir ]; then
        echo "Backing up home directory..."
	tar -czvf "$destination_dir/${user_name}_backed_up_dir_$(date +%Y-%m-%d).tar.gz" "/home/$user_name" &>/dev/null

	if [ $? -eq 0 ]; then
	    echo "Backup completed successfully. ('destination_dir/${user_name}_backed_up_dir_$(date +%Y-%m-%d).tar.gz')"
	else
	    echo "Error: Backup process encountered an issue."
	fi
    else
	echo "Error: Destination directory or username is invalid. Try again."
    fi
    ;;
  *)
    echo "Invalid choice. Exiting."
esac
