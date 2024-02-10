#!/bin/bash
#: Description : prompts user to enter the name of a file until an existing file name is entered

file="-."

while true; do
	if [ -e $file ]; then
		printf "File exists!\n"
		break
	else
		read -p "Enter the name of an existing file: " file
	fi
done
