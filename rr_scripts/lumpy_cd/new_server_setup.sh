#!/bin/bash

#scan lvm volumes
lvm vgscan -v
mkdir /mnt/root
mkdir /mnt/boot

#activate lvm volumes
lvm vgchange -a y

#mount root volume
mount /dev/mapper/vg00-rootvol /mnt/root

#mount sda1 to edit grub.conf
mount /dev/sda1 /mnt/boot

#remove ssh keys
/bin/rm /etc/ssh/ssh_host_*

#echo command to reset root passwd
echo "chroot /mnt/backup passwd    ----reset root password"

#output command to edit grub.conf and remove passwords
echo "nano /mnt/boot/grub.conf   ---comment out passwords"
