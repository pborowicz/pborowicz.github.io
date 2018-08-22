#!/bin/bash

#this puts a zypper repository into a Suse based system
echo "[linux01]
name=Red Hat Enterprise Linux
baseurl=http://10.25.10.147/rhel_6.5
enabled=1
gpgcheck=0" > /etc/yum.repos.d/rhel-linux1.repo
