#!/bin/sh

SAFE=/opt/PrivateContainer
CRYPTNAME=PrivateContainer
MNT=/home/gbg/PrivateContainer
FS=ext4

echo "Der private Datencontainer wird angelegt. Bitte hab etwas Geduld. Dieser Vorgang dauert etwa 5 Minuten."
dd if=/dev/urandom of=$SAFE bs=1M count=60000 status=progress
echo "Jetzt wird der Container verschlüsselt!"
cryptsetup -c aes-xts-plain64 -s 512 -h sha512 -y luksFormat $SAFE
cryptsetup luksOpen $SAFE $CRYPTNAME
mkfs.ext4 /dev/mapper/$CRYPTNAME
