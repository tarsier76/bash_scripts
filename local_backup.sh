#!/bin/bash

echo -e "Choose one of the following options: \n1.Backup a home directory.\n2.Backup all log files on the system.\n3.Backup a specific folder in the system."
read -r user_choice

case $user_choice in
  1)
    read -p "Enter the username for the home directory you want to backup: " user_name
    read -p "Enter the destination directory for the backup: " destination_dir

    if [ -d /home/$user_name ] && [ -d $destination_dir ]; then
    	echo "Backing up home directory..." && rsync -avz /home/$user_name/ $destination_dir/${user_name}_backed_up_dir_$(date +%Y-%m-%d) &>/dev/null
        echo "Backup completed successfully."
    else
	echo "Error: Either username or destination directory are invalid. Try again."
    fi
    ;;
  *)
    echo "Invalid choice. Exiting."
esac
