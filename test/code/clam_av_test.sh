#!/bin/bash

programname="$0"

# cd to the dev tools directory
# cd "$(dirname "$programname")/.." || exit

function usage () {
    echo
    echo "usage: $programname <file_to_send>"
    echo "error message :$0"
    exit 1
}

function send () {
    CMD="clamdscan -v --config-file $1 --fdpass $2"
    echo "- Running command: $CMD"
    if ! eval "$CMD" ; then
        echo >&2
        echo "Sending to [$0] failed" >&2
    fi
    echo
}
FILE=$1

if [[ -z "$FILE" ]]; then
  usage "Missing file"
fi

if [ ! -f $FILE ]; then
  usage "$FILE does not exist"
fi

send "/etc/clamav/clamd-primary.conf" "$FILE"
send "/etc/clamav/clamd-secondary.conf" "$FILE"
