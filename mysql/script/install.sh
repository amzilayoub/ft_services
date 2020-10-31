#!/bin/sh

apk add openrc --no-cache
mkdir /run/openrc
touch /run/openrc/softlevel
rc-status
apk update
apk upgrade
apk add nginx
adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
apk add mysql mysql-client
/etc/init.d/mariadb setup
echo test > /www/index.html