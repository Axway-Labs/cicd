#!/bin/bash

CHECK_CODE=$(curl -s -o /dev/null -I -w "%{http_code}" http://169.254.169.254/latest/meta-data/)
COUNT=0

if [ "${CHECK_CODE}" == "200" ];then
   LOCAL_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
   echo "[INFO]"
   echo "[INFO] - Updating Hosts File"
   echo "[INFO]"
   COUNT=$(grep -c "$LOCAL_IP api-env" /etc/hosts )

   echo "[INFO] - Updating Hosts with entry $LOCAL_IP api-env"
   echo "[INFO]"
   if [ ${COUNT} -lt 1 ];then
      sudo -- sh -c -e "echo '$LOCAL_IP api-env' >> /etc/hosts";
   fi
fi

