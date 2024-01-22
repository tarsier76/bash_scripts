#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "The script needs to be run with elevated privilleges. Exiting."
fi

echo -e "Choose one of the following options: \n1.Backup a home directory.\n2.Backup all log files on the system.\n3.Backup a specific folder in the system."
read -r user_choice

case $user_choice in
  1)
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
  2)
    echo "Backing up all log files..."
    tar -czvf "/tmp/all_logs_backup_$(date +%Y-%m-%d).tar.gz" /var/log/* &>/dev/null

    if [ $? -eq 0 ]; then
      echo "Backup completed succesfully. ('/tmp/all_logs_backup_$(date +%Y-%m-%d).tar.gz')"
    else
      echo "Error Backup process encountered an issue."
    fi
    ;;
  3)
    read -p "Enter the path of the folder you want to backup: " folder_path
    read -p "Enter the destination directory for the backup: " destination_dir

    if [ -d $folder_path ] && [ -d $destination_dir ]; then
      echo "Backing up specific folder..."
      tar -czvf "$destination_dir/$(basename $folder_path)_backup_$(date +%Y-%m-%d).tar.gz" "$folder_path" &>/dev/null

      if [ $? -eq 0 ]; then
        echo "Backup completed successfully. (${destination_dir}/$(basename $folder_path)_backup_$(date +%Y-%m-%d).tar.gz)"
      else
        echo "Error: Backup process encountered an issue."
      fi
    else
      echo "Error: Folder or destination directory is invalid. Try again."
    fi
    ;;
  *)
    echo "Invalid choice. Exiting."
    ;;
esac
