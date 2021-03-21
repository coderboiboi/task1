#!/bin/bash

if [ $# -ne 1 ]; then
  echo "incorrect number of parameters
  usage: $0 [logfile]
  example: $0 apache.log"
    exit 1
fi

logfile=$1

cat $logfile | while read line
do
  http_code="$(echo $line | cut -d' ' -f9)"
  first_char=${http_code::1}
  
  if [ $first_char = 4 ] || [ $first_char = 5 ]; then
    ((err_count++))
    echo $err_count > tmp
  fi  
done 

read -r err_count < tmp
rm tmp
echo $err_count

if [ $err_count -gt 100 ]; then
  echo "$err_count 4XX and 5XX errors" | mailx -s "$logfile has more than 100 errors" abc@gmail.com
fi
