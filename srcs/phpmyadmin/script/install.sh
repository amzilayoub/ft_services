#!/bin/sh


apk update;

mkdir /www;

adduser -D -g 'www' www;

apk update
apk upgrade
apk add openrc --no-cache
apk add nginx
apk update && apk upgrade
chown -R www:www /var/lib/nginx;

apk update
apk upgrade
apk add openrc --no-cache
apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
apk --no-cache add php7 php7-fpm php7-curl php7-json php7-mbstring
apk --no-cache add php7-zip php7-gd php7-soap php7-ssh2 php7-xml
apk --no-cache add php7-tokenizer php7-mysqli lighttpd php7-cgi fcgi
apk update && apk upgrade
apk add php-session
apk add php7 php7-fpm php7-opcache
apk add php7-gd php7-mysqli php7-zlib php7-curl



cd /www
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
rm phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages/* .
rm -rf phpMyAdmin-5.0.2-all-languages

chown -R www:www /www/
mkdir /run/openrc
touch /run/openrc/softlevel
rc-status