#!/bin/bash

echo "Sending to primary"
clamdscan -v --config-file /etc/clamav/clamd-primary.conf --fdpass --stream Sample-jpg-image-5mb.jpg
echo
echo

echo "Sending to secondary"
clamdscan -v --config-file /etc/clamav/clamd-secondary.conf --fdpass --stream Sample-jpg-image-5mb.jpg
echo
echo

