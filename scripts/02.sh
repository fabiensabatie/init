#!/bin/sh
(apt-get update; apt-get upgrade) > /var/log/update_script.log
res=`cat /etc/crontab | grep "(apt-get update; apt-get upgrade) > /var/log/update_script.log"`
if [ -z "${res}" ]; then
	echo "* * * * * root (apt-get update; apt-get upgrade) > /var/log/update_script.log" >> /etc/crontab
fi
