#/bin/bash

ID="$(id -u)"

case $ID in
	0) echo "You are root.";;
	*) echo "You are NOT root.";;
esac

exit 0
