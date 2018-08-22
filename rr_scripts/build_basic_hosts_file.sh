#!/bin/bash

# This file builds a basic hostfile with the localhost entries and an entry for the host that points to it's IP address

echo "127.0.0.1"$'\t'"localhost.localdomain localhost" > /etc/hosts
echo "::1"$'\t'"localhost6 localhost6.localdomain6" >> /etc/hosts
echo "" >> /etc/hosts
echo `ifconfig eth0 | grep 'inet addr'| cut -d: -f2| cut -d\  -f1`$'\t'`hostname` >> /etc/hosts
