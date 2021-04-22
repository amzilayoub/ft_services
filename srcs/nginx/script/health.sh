#!/bin/sh
NGINX_COUNT=$(ps | grep nginx | grep -vc grep)
SSH_COUNT=$(ps | grep ssh | grep -vc grep)
if [ "$NGINX_COUNT" -eq 0 -o "$SSH_COUNT" -eq 0 ]
then
    exit 15
else
    exit 0
fi