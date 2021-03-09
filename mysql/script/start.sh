#!/bin/sh

service mariadb start
# mariadb -u root -e "FLUSH PRIVILEGES;ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';"
/usr/bin/mysqld --user=root