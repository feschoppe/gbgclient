#!/bin/sh

SAFE=/opt/PrivateContainer
CRYPTNAME=PrivateContainer
MNT=/home/gbg/PrivateContainer
FS=ext4
LOOPDEV=`losetup -f`

if [ "`losetup -a | grep -c "$SAFE"`" != "0" ]; then
        echo "bereits eingehängt"
        exit
fi

if [ -d $MNT ]; then
	echo "Ordner existiert!"
else
	echo "Ordner existiert nicht!"
	mkdir $MNT
fi

/sbin/losetup $LOOPDEV $SAFE
/sbin/cryptsetup luksOpen $LOOPDEV $CRYPTNAME
/bin/mount -t $FS /dev/mapper/$CRYPTNAME $MNT
chown -R gbg:gbg $MNT