#!/bin/bash

CHECK_COMMAND="$(apt --help | echo $?)"

case $CHECK_COMMAND in
	0) echo "Apt command is available on the machine.";;
	*) echo "Apt command is not present in the machine.";;
esac
