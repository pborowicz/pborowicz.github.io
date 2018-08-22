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

