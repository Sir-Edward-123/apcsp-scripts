#!/bin/bash

# method to ping check and print result
ping_and_check_result () {
  ping $1 -c 1 -w 1 > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo $1 : alive
  else
    echo $1 : dead
  fi
}

if [ $# -gt 0 ]; then
  for arg in $@; do
    ping_and_check_result $arg
  done
else
  NUM=1
  while [ $NUM -lt 12 ]; do
    if [ $NUM -lt 10 ]; then
      ping_and_check_result dl0$NUM
    else
      ping_and_check_result dl$NUM
    fi
    let NUM=$NUM+1
  done
fi

exit 0
