#!/bin/sh
RET=$(ps | grep vsftpd | grep -vc grep)
if [ "$RET" -eq 0 ]
then
    exit 15
else
    exit 0
fi