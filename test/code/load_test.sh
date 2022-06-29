#!/bin/bash
for i in {1..10}
do
    clamdscan -v  --config-file /etc/clamav/clamd-primary.conf --fdpass --stream Sample-jpg-image-5mb.jpg &
    echo "Ran clamscan $i times"
done
