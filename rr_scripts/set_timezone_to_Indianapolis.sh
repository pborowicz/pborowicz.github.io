#!/bin/bash

#fix /etc/sysconfig/clock
echo 'ZONE=\"America/Indianapolis\"' >/etc/sysconfig/clock
echo 'UTC=true' >>/etc/sysconfig/clock
echo 'ARC=false' >>/etc/sysconfig/clock
#fix /etc/localtime
/bin/rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Indianapolis /etc/localtime

