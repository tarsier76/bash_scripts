#!/bin/bash
#: Description : checks root filesystem's used space and if it goes over 85% sends e-mail notification with more information

FILE_TO_SEND=/tmp/mailfile
MAIL_LIST="random@testing.com 12345@domain.net"
ROOT_PERCENT_USED_SPACE="$(df -h / | awk -F " " '{print $5}' | sed -n -e 's/%/ /' -e '2p')"
FILES_AND_FOLDERS_ROOT=$(find / 2>/dev/null -maxdepth 1 -type f,d -exec du -sh {} \;)

if [ $ROOT_PERCENT_USED_SPACE -ge 85 ]
then
	echo "$FILES_AND_FOLDERS_ROOT" > "$FILE_TO_SEND"
	mail -s "Root filesystem space is above 85% usage.Current is ${$ROOT_PERCENT_USED_SPACE}%" $MAIL_LIST < $FILE_TO_SEND
else
	exit
fi
