#!/bin/bash

#: Description: Creates another script in your home directory, makes it executable and executes it in the current shell environment

new_script="print_hello_world.sh"

echo 'printf "%s\n" "Hello, World!"' > $HOME/"$new_script"

chmod +x "$HOME/$new_script"

source "$HOME/$new_script"
