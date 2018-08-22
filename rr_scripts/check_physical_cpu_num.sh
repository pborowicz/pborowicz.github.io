#!/bin/bash

numCPU=`cat /proc/cpuinfo | grep -c processor`
numPhys=`cat /proc/cpuinfo | grep "physical id" | sort -n | uniq | wc -l`
numCores=`cat /proc/cpuinfo | grep "cpu cores" | uniq | awk '{print $NF}'`
if [ -Z $numCores ]; then
numCores=0
fi
cat /proc/cpuinfo | grep -q "ht"
isHT=$?
numThrd=1
if [ $isHT -eq 0 ]
then
numThrd=2
fi

sibs=$(($numCores * $numThrd))
if [ $sibs -ne "0" ]; then
  socks=$(($numCPU / $sibs))
else
  socks="0, Virtual Machine?"
fi

echo "Physical sockets are $socks"
