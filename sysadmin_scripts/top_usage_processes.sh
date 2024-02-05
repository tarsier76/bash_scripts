#!/bin/bash

ps aux --sort=-%mem | head -n 11 | awk -F" " '{print $2, $3, $4}'

exit 0
