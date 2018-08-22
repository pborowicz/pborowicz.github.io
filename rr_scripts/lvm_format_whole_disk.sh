#!/bin/ksh
#Create a single primary partiton with whole disk size and create LVM PV on it
disk=$1
partno=1
if [[ -z $disk ]]; then
 echo "Usage: $0 disk device name: e.g $0 /dev/sdb"
 exit
fi
 
 
if [[ -e ${disk}${partno} ]]; then
 echo "==> ${disk}${partno} already exist"
 exit
fi
 
echo "==> Create MBR label"
parted -s $disk  mklabel msdos
ncyl=$(parted $disk unit cyl print  | sed -n 's/.*: \([0-9]*\)cyl/\1/p')
 
if [[ $ncyl != [0-9]* ]]; then
 echo "disk $disk has invalid cylinders number: $ncyl"
 exit
fi
 
echo "==> create primary parition  $partno with $ncyl cylinders"
parted -a optimal $disk mkpart primary 0cyl ${ncyl}cyl
echo "==> set partition $partno to type: lvm "
parted $disk set $partno lvm on
partprobe > /dev/null 2>&1
echo "==> create PV ${disk}${partno} "
pvcreate ${disk}${partno}