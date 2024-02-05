#!/bin/bash

os_type="$(uname)"

case $os_type in 
	Linux) 
		distro=$(awk -F= '{print $2}' /etc/os-release | sed -n '2 p')
		echo "GNU/Linux platform detected"
		echo "Distribution: $distro";;
	Darwin) 
		echo "Mac OS X platform detected.";;
	MINGW32_NT*) 
		echo "Windows NT 32 bit platform detected.";;
	MINGW64_NT*)
		echo "Windows NT 64 bit platform detected."
esac
