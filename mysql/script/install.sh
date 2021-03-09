#!/bin/sh

apk update
apk upgrade
apk add openrc --no-cache
mkdir /run/openrc
touch /run/openrc/softlevel
rc-status
apk add mysql mysql-client
/etc/init.d/mariadb setup
service mariadb start