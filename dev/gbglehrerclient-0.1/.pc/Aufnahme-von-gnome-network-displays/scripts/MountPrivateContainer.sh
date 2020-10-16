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

#Thunderbird-Profilordner verlinken
MAIL=/home/gbg/PrivateContainer/.thunderbird

if [ -d $MAIL ]; then
	echo "Thunderbird-Profil existiert und wird verlinkt."
	ln -s $MAIL /home/gbg/
else
	echo "Thunderbird-Profil existiert nicht!"
fi

#Default-Config-Ordner löschen und durch benutzerdefinierten ersetzen
CONFIG=/home/gbg/PrivateContainer/.config

if [ -d $CONFIG ]; then
	echo "Config existiert und wird verlinkt."
	#Statische Default-Config löschen
	rm -r /home/gbg/.config
	#Mit benutzerdefinierter Config verlinken
	ln -s $CONFIG /home/gbg/
else
	echo "Config existiert nicht!"
fi
