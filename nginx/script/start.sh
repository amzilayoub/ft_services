#!/bin/sh

rc-status
service nginx start
service sshd restart
top