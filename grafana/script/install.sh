#!/bin/sh

apk add libc6-compat
wget https://dl.grafana.com/oss/release/grafana-7.4.5.linux-amd64.tar.gz
tar -zxvf grafana-7.4.5.linux-amd64.tar.gz