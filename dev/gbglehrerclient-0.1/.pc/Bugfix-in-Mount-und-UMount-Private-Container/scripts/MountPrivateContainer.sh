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
	echo "Mount-Ordner erstellen..."
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
	#Prüfen, ob bereits Profil vorhanden ist, das gelöscht werden muss.
	if [ -d  /home/gbg/.thunderbird ]; then
		rm -r /home/gbg/.thunderbird
		ln -s $MAIL /home/gbg/
	else
		ln -s $MAIL /home/gbg/
	fi
else
	echo "Thunderbird-Profil existiert nicht!"
fi

#Firefox-Profilordner verlinken
MOZILLA=/home/gbg/PrivateContainer/.mozilla

if [ -d $MOZILLA ]; then
	echo "Firefox-Profil existiert und wird verlinkt."
	#Prüfen, ob bereits Profil vorhanden ist, das gelöscht werden muss.
	if [ -d  /home/gbg/.mozilla ]; then
		rm -r /home/gbg/.mozilla
		ln -s $MOZILLA /home/gbg/
	else
		ln -s $MOZILLA /home/gbg/
	fi
else
	echo "Firefox-Profil existiert nicht!"
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

#PKI-Ordner löschen und durch benutzerdefinierten ersetzen
PKI=/home/gbg/PrivateContainer/.pki

if [ -d $PKI ]; then
	echo "PKI existiert und wird verlinkt."
	#Statische pki-Config löschen
	#rm -r /home/gbg/.pki
	#Mit benutzerdefinierter pki verlinken
	ln -s $PKI /home/gbg/
else
	echo "PKI existiert nicht!"
fi

#Local-Ordner löschen und durch benutzerdefinierten ersetzen
LOCAL=/home/gbg/PrivateContainer/.local

if [ -d $LOCAL ]; then
	echo "LOCAL existiert und wird verlinkt."
	#Statischen LOCAL-Ordner löschen
	rm -r /home/gbg/.local
	#Mit benutzerdefiniertem LOCAL-Ordner verlinken
	ln -s $LOCAL /home/gbg/
else
	echo "LOCAL existiert nicht!"
fi

#Cache-Ordner löschen und durch benutzerdefinierten ersetzen
CACHE=/home/gbg/PrivateContainer/.cache

if [ -d $CACHE ]; then
	echo "CACHE existiert und wird verlinkt."
	#Statischen Cache löschen
	rm -r /home/gbg/.cache
	#Mit benutzerdefiniertem cache verlinken
	ln -s $CACHE /home/gbg/
else
	echo "CACHE existiert nicht!"
fi

