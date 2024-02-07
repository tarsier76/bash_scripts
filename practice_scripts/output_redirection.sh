#!/bin/bash

#: Description : write random float numbers to a file and to a variable

rn_var=$(printf "%d.%d\n" $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM | tee $HOME/random_numbers.txt)

echo "$rn_var"
