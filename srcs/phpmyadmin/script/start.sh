#!/bin/sh

rc-status
service php-fpm7 start
service nginx start
top