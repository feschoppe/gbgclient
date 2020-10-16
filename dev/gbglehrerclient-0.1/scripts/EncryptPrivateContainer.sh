#!/bin/sh

SAFE=/opt/PrivateContainer
CRYPTNAME=PrivateContainer
MNT=/home/gbg/PrivateContainer
FS=ext4


echo "Jetzt wird der Container verschlüsselt!"
cryptsetup -c aes-xts-plain64 -s 512 -h sha512 -y luksFormat $SAFE
cryptsetup luksOpen $SAFE $CRYPTNAME
mkfs.ext4 /dev/mapper/$CRYPTNAME
