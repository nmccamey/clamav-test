#!/bin/bash
while [ 1 ]
do
  NOW=$(date)
  OUTPUT=$(echo "PING" | nc clamav-pri 3310 2>&1 )
  if [ "$OUTPUT" == "PONG" ]; then
    printf "%s - Up!\n" "$NOW"
  else
    printf "%s - Down! %s\n" "$NOW" "$OUTPUT"
  fi
  sleep 1
done
