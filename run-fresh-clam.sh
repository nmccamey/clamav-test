#/bin/bash

docker-compose exec -it -u clamav clamav-sec freshclam --on-update-execute=EXIT_1 
retVal=$?
if [ $retVal -ne 0 ]; then
    docker-compose exec -it -u clamav clamav-sec clamdscan --reload
    docker-compose exec -it -u clamav clamav-pri clamdscan --reload
fi
