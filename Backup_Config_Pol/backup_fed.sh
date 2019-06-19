#!/bin/bash

export GW_DIR=/opt/axway/Axway-7.6.2/apigateway
export BACKUP_FILE=pol_backup
export GROUP=api-env

for DIR in $(find ${GW_DIR}/groups/topologylinks/${GROUP}/conf/????????-* -maxdepth 0 -type d);
do
   ${GW_DIR}/posix/bin/projpack --create --name=${BACKUP_FILE} --type=pol --passphrase-none --add ${DIR} --projpass-none
done


rm /tmp/na_na.log
