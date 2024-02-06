#!/bin/bash
#: Description : print formatted sales report

header="\n%-10s %s %10s %10s\n"
items_list="%-10s %8.2f %10d %10.2f\n"
delimiter="====================="
delimiter=$delimiter$delimiter

printf "$header" ITEM "PER UNIT" NUM TOTAL

printf "%s\n" "$delimiter"

printf "$items_list" Chair 79.95 4 319.80 \
 		     Table 209.99 1 209.99 \
 		     Armchair 315.49 2 630.98
