#!/bin/bash

prepend() {
	[ -d "$2" ] && eval $1="$2\${$1:+\:\$$1}" && export $1; # If env variable is empty don't use ":" when prepending
}

prepend PATH /tmp # Arguments: Environment variable and directory to prepend to it 

