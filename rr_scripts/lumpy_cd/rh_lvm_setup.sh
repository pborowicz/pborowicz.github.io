#!/bin/bash


#scan lvm volumes
lvm vgscan -v
mkdir /mnt/root
mkdir /mnt/boot

#activate lvm volumes
lvm vgchange -a y

#######################
# SPECIFY ROOT VOLUME #
######################
rootvol = /dev/mapper/vg00-rootvol

#######################
# SPECIFY BOOT VOLUME #
######################
bootvol = /dev/sda1

####################
# SPECIFY TIMEZONE #
####################
tzone = /usr/share/zoneinfo/America/Indiana/Indianapolis


#mount root volume
mount /dev/mapper/vg00-rootvol /mnt/root

#mount boot volume
mount $bootvol /mnt/boot

#remove ssh keys
/bin/rm /mnt/root/etc/ssh/ssh_host_*

#remove 70-persistant-net rules - this locks the ethernet device to a specific mac
/bin/rm /mnt/root/etc/udev/rules.d/70-persistent-net.rules

#edit /etc/sysconfig/network
echo "input hostname"
read hn
sed -i "/HOST/c\HOSTNAME=$hn" /mnt/root/etc/sysconfig/network
echo "input gateway"
read gw
sed -i "/GATE/c\GATEWAY=$gw" /mnt/root/etc/sysconfig/network

#fix resolv.conf
echo "search rolls-royce.local allison.com rollsy-royce.com" > /mnt/root/etc/resolv.conf
echo "nameserver 10.24.64.12" >> /mnt/root/etc/resolv.conf
echo "nameserver 10.24.64.13" >> /mnt/root/etc/resolv.conf

#fix ifcfg-eth#
mv /mnt/root/etc/sysconfig/network-scripts/ifcfg-eth1 /mnt/root/etc/sysconfig/network-scripts/ifcfg-eth0
sed -i "/DEVICE/c\DEVICE=eth0" /mnt/root/etc/sysconfig/network-scripts/ifcfg-eth0
echo "enter IP"
read ip
sed -i "/IPADDR/c\IPADDR=$ip" /mnt/root/etc/sysconfig/network-scripts/ifcfg-eth0
echo "enter Subnet Mask"
read nm
sed -i "/NETMASK/c\NETMASK=$nm" /mnt/root/etc/sysconfig/network-scripts/ifcfg-eth0

#comment out boot passwords
sed -i '/password/s|^|\#|' /mnt/boot/grub/grub.conf

#fix time
/bin/rm /mnt/root/etc/localtime
ln -s $tzone /mnt/root/etc/localtime

#set uS keymap
sed -i '/KEYTABLE/c\KEYTABLE=\"us\"' /mnt/root/etc/sysconfig/keyboard
sed -i '/LAYOUT/c\LAYOUT=\"us\"' /mnt/root/etc/sysconfig/keyboard

#echo command to reset root passwd
echo "chroot /mnt/root passwd    ----reset root password"
echo "change /mnt/root/etc/ssh/sshd_conf to allow root logon if necessary"
