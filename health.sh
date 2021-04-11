#!/bin/sh
RET=$(ps | grep vsftpd | grep -vc grep)
if [ "$RET" -eq 0 ]
then
    exit 1
    echo 1
else
    echo 0
    exit 0
fi