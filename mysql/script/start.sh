#!/bin/sh


rc-status
cp my.cnf /etc/my.cnf
/etc/init.d/mariadb setup
mysql_install_db --user=mysql --datadir=/var/lib/mysql
rc-service mariadb start
mariadb -u root -e "CREATE DATABASE wordpress;"
mariadb -u root wordpress < /wordpress.sql
mariadb -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';";
mariadb -u root -e "FLUSH PRIVILEGES;";
top


# /etc/init.d/mariadb setup
# service mariadb start
# mariadb -u root -e "CREATE DATABASE wordpress;"
# mariadb -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
# mariadb -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';";
# mariadb -u root -e "FLUSH PRIVILEGES;";
# sh