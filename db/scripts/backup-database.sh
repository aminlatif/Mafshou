#!/bin/bash

scriptDir="`dirname "$0"`"
cd $scriptDir
set -a; source ../../.env; set +a

ciSuffix="$(date +%Y%m%d-%H%M)"
if [ $1 ]
then
ciSuffix=$1
fi

docker exec -i "${MAFSHOU_PROJECT_NAME}_db" pg_dump -U "${MAFSHOU_DATABASE_USERNAME}" "${MAFSHOU_DATABASE_NAME}" > ../backup/${MAFSHOU_DATABASE_NAME}-${ciSuffix}.sql