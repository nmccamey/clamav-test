#!/bin/bash
for i in {1..100}
do
    clamdscan -v  --config-file /etc/clamav/clamd-primary.conf --fdpass Sample-jpg-image-5mb.jpg &
    echo "Ran clamscan $i times"
done
