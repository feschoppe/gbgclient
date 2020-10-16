#!/bin/sh

SAFE=/opt/PrivateContainer
CRYPTNAME=PrivateContainer
MNT=/home/gbg/PrivateContainer
FS=ext4
LOOPDEV=`losetup -a | grep "$SAFE" | sed "s/: .*//"`

if [ "`losetup -a | grep -c "$SAFE"`" != "1" ]; then 
	echo "nicht eingehängt"
	exit
fi

/bin/umount $MNT
/sbin/cryptsetup luksClose $CRYPTNAME
/sbin/losetup -d $LOOPDEV
