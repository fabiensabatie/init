#!/bin/sh
(sudo apt-get update; sudo apt-get upgrade) > /var/log/update_script.log
res=`cat /etc/crontab | grep "(sudo apt-get update; sudo apt-get upgrade) > /var/log/update_script.log"`
if [ -z "${res}" ]; then
	echo "* * * * * root (sudo apt-get update; sudo apt-get upgrade) > /var/log/update_script.log" >> /etc/crontab
fi
