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

MAIL=/home/gbg/.thunderbird
if [ -e "$MAIL" ]; then
    if [ ! -L "$MAIL" ]
    then
        echo "Thunderbird-Profil sichern."
        mv $MAIL $MNT
    else
        echo "Das Thunderbird-Profil muss nicht gesichert werden."
    fi
else
  echo "=> Es existiert kein Thunderbird-Profil."
fi

/bin/umount $MNT
/sbin/cryptsetup luksClose $CRYPTNAME
/sbin/losetup -d $LOOPDEV
