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
apk update && apk upgrade
apk add php7 php7-fpm php7-opcache
apk add php7-gd php7-mysqli php7-zlib php7-curl
rc-update add php-fpm7 default
cd /www
apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
apk add php-session
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
rm phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin