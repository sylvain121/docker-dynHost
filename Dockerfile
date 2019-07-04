FROM  	alpine	
MAINTAINER 	sylvain121

RUN    	apk add --no-cache curl
COPY 	cron-dyndns /etc/cron.d/cron-dyndns 
RUN 	crontab /etc/cron.d/cron-dyndns
RUN 	touch /var/log/cron.log
COPY	pool.sh /sbin/
RUN 	chmod +x /sbin/pool.sh
CMD 	crond && tail -f /var/log/cron.log
