#!/bin/sh

SAFE=/opt/PrivateContainer
CRYPTNAME=PrivateContainer
MNT=/tmp/gbg/PrivateContainer
FS=ext4
LOOPDEV=`losetup -a | grep "$SAFE" | sed "s/: .*//"`

#Prüfen, ob das verschlüsselte Dateisystem eingehängt ist.
if [ "`losetup -a | grep -c "$SAFE"`" != "1" ]; then 
	echo "nicht eingehängt"
	exit
fi

#Verschlüsseltes Dateisystem aushängen
#-l force umount
/bin/umount -l $MNT
/sbin/cryptsetup luksClose $CRYPTNAME
/sbin/losetup -d $LOOPDEV

mkdir /tmp/gbg
