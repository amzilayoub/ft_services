#!/bin/sh

apk --no-cache update
apk --no-cache add openrc

mkdir /run/openrc
touch /run/openrc/softlevel
rc-status

apk add libc6-compat
apk add influxdb
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz
tar xf telegraf-1.18.0_linux_amd64.tar.gz
