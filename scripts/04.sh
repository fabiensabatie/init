#!/bin/sh
res=`cat /etc/crontab | grep "\* \* \* \* \* root bash /root/script.sh"`
if [ -z "${res}" ]; then
	echo "* * * * * root bash /root/script.sh" >> /etc/crontab
fi
if [ ! -f /var/log/cron.log ]; then
	touch /var/log/cron.log
	stat -c %Y /etc/crontab >> /var/log/cron.log
fi
mod=`cat /var/log/cron.log`
res=`stat -c %Y /etc/crontab`
if [ "${res}" != "${mod}" ]; then
	echo "${res}" > /var/log/cron.log
	echo "File edited" >> /home/aiden/Desktop/res
fi
