#!/bin/sh

service influxdb start
./telegraf-1.18.0/usr/bin/telegraf --config ./telegraf-1.18.0/etc/telegraf/telegraf.conf
top
# sh