#!bin/sh

rc-status
rc-service vsftpd restart
rc-update add vsftpd
top