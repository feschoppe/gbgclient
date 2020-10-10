#!/bin/sh

SAFE=/opt/PrivateContainer
CRYPTNAME=PrivateContainer
MNT=/home/gbg/PrivateContainer
FS=ext4

dd if=/dev/urandom of=$SAFE bs=1M count=250
cryptsetup -c aes-xts-plain64 -s 512 -h sha512 -y luksFormat $SAFE
cryptsetup luksOpen $SAFE $CRYPTNAME
mkfs.ext4 /dev/mapper/$CRYPTNAME

#LOOPDEV=`losetup -f`
#if [ "`losetup -a | grep -c "$SAFE"`" != "0" ]; then
#        echo "bereits eingehängt"
#        exit
#fi

#mkdir $MNT
#/sbin/losetup $LOOPDEV $SAFE
#/sbin/cryptsetup luksOpen $LOOPDEV $CRYPTNAME
#/bin/mount -t $FS /dev/mapper/$CRYPTNAME $MNT
#chown -R username $MNT
