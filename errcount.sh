#!/bin/bash


if [ $# -ne 1 ]; then
  echo "incorrect number of parameters
  usage: $0 [logfile]
  example: $0 apache.log"
    exit 1
fi

logfile=$1
err_count=$(awk {'print $9 ""'} $logfile | cut -c1 | grep '4\|5' | wc -l)
echo $err_count

if [ $err_count -gt 100 ]; then
  echo "$err_count 4XX and 5XX errors" | mailx -s "$logfile has more than 100 errors" abc@gmail.com
fi
