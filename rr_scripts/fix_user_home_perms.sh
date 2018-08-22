#!/bin/bash

## this script reads the entries from standard /etc/passwd file
## and sets the permissions. It will process all lines

#############################
##DO NOT ## DO NOT ## DO NOT
###  DO NOT run directly on /etc/passwd
### If you do, it will change system account permissions
### This script is for reference only

############

while IFS=':' read -r login pass uid gid uname homedir environment; do
        chown $login:$gid "$homedir";
done < /etc/passwd
chown root:root /var/empty/sshd
