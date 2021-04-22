#!/bin/sh


# Installing Nginx
apk update;
mkdir /www;
adduser -D -g 'www' www;
apk update
apk upgrade
apk add openrc --no-cache
apk add nginx
apk update && apk upgrade
chown -R www:www /var/lib/nginx;
chown -R www:www /www/
mkdir /run/openrc
touch /run/openrc/softlevel
rc-status

# Establishing SSL Connection
apk add openssl;
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

# Creating SSH Service
apk add openssh
rc-update add sshd
rc-status
/etc/init.d/sshd start

# Creating User and a Password for SSH
adduser -D admin
echo admin:admin | chpasswd

# Creating a test index.html
echo test > /www/index.html

# apk add openrc --no-cache
# mkdir /run/openrc
# touch /run/openrc/softlevel
# rc-status
# apk update
# apk upgrade
# apk add nginx
# adduser -D -g 'www' www
# mkdir /www
# chown -R www:www /var/lib/nginx
# chown -R www:www /www
# echo test > /www/index.html