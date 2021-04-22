# #!/bin/sh

apk --no-cache update
apk --no-cache add openrc
apk --no-cache add mariadb mariadb-common mariadb-client

mkdir /run/openrc
touch /run/openrc/softlevel
rc-status

mysql_install_db --user=mysql --datadir=/var/lib/mysql