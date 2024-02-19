#!/bin/bash
#: Description : Converts decimal to binary and binary to decimal

nr=100

echo "obase=2;$nr" | bc

no=1100100

echo "obase=10;ibase=2;$no" | bc

echo "10^10" | bc

echo "sqrt(100)" | bc 
