#!/bin/sh
MYSQL_COUNT=$(ps | grep mysql | grep -vc grep)
if [ "$MYSQL_COUNT" -eq 0 ]
then
    exit 15
else
    exit 0
fi