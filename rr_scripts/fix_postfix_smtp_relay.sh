#!/bin/bash

## by Paul Borowicz
# This replaces the relayhost with the entry you specify and restarts postfix

#read current entry for relayhost
echo "Current relayhost for postfix is: "; sed -n '/^relayhost.*/p' /etc/postfix/main.cf
while true; do
    read -p "Do you wish to replace with: $1?" yn
    case $yn in
        #replace if yes
	[Yy]* ) sed  -i "s/^relayhost.*/relayhost = $1/g" /etc/postfix/main.cf ; break;;
	#exit if no
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
echo "Complete"
done

/etc/init.d/postfix restart
