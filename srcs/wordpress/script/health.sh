#!/bin/sh
NGINX_COUNT=$(ps | grep nginx | grep -vc grep)
PHP_COUNT=$(ps | grep php | grep -vc grep)
if [ "$NGINX_COUNT" -eq 0 -o "$PHP_COUNT" -eq 0 ]
then
    exit 15
else
    exit 0
fi