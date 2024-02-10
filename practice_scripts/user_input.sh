#!/bin/bash
#: Description : prompt user to enter a number until it's between 20 and 30

answer=0

while true; do
	if [ "$answer" -ge 20 ] && [ "$answer" -le 30 ]; then
		printf "Good answer!"
		exit 
	else
		read -p "Enter a number between 20 and 30: " answer
	fi
done
