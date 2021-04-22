#!/bin/sh
INFLUX_COUNT=$(ps | grep influx | grep -vc grep)
TELEGRAF_COUNT=$(ps | grep telegraf | grep -vc grep)
if [ "$INFLUX_COUNT" -eq 0 -o "$TELEGRAF_COUNT" -eq 0 ]
then
    exit 15
else
    exit 0
fi