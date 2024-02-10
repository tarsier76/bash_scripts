#!/bin/bash
#: Description : takes as input an integer, converts integer into value of days, hours, minutes and seconds 

secs_in_day=86400
secs_in_hour=3600
mins_in_hour=60
secs_in_min=60

days=$(( $1 / $secs_in_day ))
secs_left=$(( $1 % $secs_in_day ))
printf "%d:%02d:%02d:%02d\n" "$days" "$(($secs_left / $secs_in_hour))" \
	"$(( ($secs_left / $mins_in_hour) % $mins_in_hour ))" "$(($secs_left % $secs_in_min))"
