#!/bin/bash

scp u8200937@usindpp-tce003v:/tmp/output/passwd /etc/
scp u8200937@usindpp-tce003v:/tmp/output/shadow /etc/

mkdir /local/home/u8200937
scp u8200937@10.24.32.72:/local/home/u8200937/.* /local/home/u8200937/
chown u8200937:techsup /local/home/u8200937


mkdir /local/home/rz5pmm
cp /local/home/u8200937/.* /local/home/rz5pmm/
mkdir /local/home/bzqqf0
cp /local/home/u8200937/.* /local/home/bzqqf0/
mkdir /local/home/szxyz1
cp /local/home/u8200937/.* /local/home/szxyz1/
mkdir /local/home/fzz90g
cp /local/home/u8200937/.* /local/home/fzz90g/
mkdir /local/home/tzf5sy
cp /local/home/u8200937/.* /local/home/tzf5sy/
mkdir /local/home/iecj0
cp /local/home/u8200937/.* /local/home/iecj0/
mkdir /local/home/fzyqkl
cp /local/home/u8200937/.* /local/home/fzyqkl/
mkdir /local/home/vzb0jr
cp /local/home/u8200937/.* /local/home/vzb0jr/
mkdir /local/home/itmea
cp /local/home/u8200937/.* /local/home/itmea/
mkdir /local/home/qz4f0x
cp /local/home/u8200937/.* /local/home/qz4f0x/
mkdir /local/home/qzvkhq/
cp /local/home/u8200937/.* /local/home/qzvkhq/

echo "%techsup        ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "%dba            ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

