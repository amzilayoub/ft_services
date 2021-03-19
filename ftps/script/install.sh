#!bin/sh

# Install VSFTPD
apk add vsftpd
mkdir /srv/ftp
chown nobody:nogroup /srv/ftp
echo "anon" | tee /srv/ftp/anon.txt

apk add openrc --no-cache
mkdir /run/openrc
touch /run/openrc/softlevel
rc-status
echo root:root | chpasswd

rc-service vsftpd restart
rc-update add vsftpd

# SSL
apk add openssl
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
