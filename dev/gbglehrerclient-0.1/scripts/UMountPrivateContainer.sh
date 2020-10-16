#!/bin/sh

SAFE=/opt/PrivateContainer
CRYPTNAME=PrivateContainer
MNT=/home/gbg/PrivateContainer
FS=ext4
LOOPDEV=`losetup -a | grep "$SAFE" | sed "s/: .*//"`

#Prüfen, ob das verschlüsselte Dateisystem eingehängt ist.
if [ "`losetup -a | grep -c "$SAFE"`" != "1" ]; then 
	echo "nicht eingehängt"
	exit
fi

#Falls vorhanden, Thunderbird-Profil sichern
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

#Config-Ordner sichern
CONFIG=/home/gbg/.config
if [ -e "$CONFIG" ]; then
    if [ ! -L "$CONFIG" ]
    then
        echo "Config sichern."
        cp -r $CONFIG $MNT
    else
        echo "Die Config muss nicht gesichert werden."
    fi
else
  echo "=> Es existiert kein Config-Ordner."
fi

#Verschlüsseltes Dateisystem aushängen
/bin/umount $MNT
/sbin/cryptsetup luksClose $CRYPTNAME
/sbin/losetup -d $LOOPDEV
