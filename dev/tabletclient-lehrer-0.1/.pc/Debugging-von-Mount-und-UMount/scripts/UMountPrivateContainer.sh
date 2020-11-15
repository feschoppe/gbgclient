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

#Falls vorhanden, Firefox-Profil sichern
MOZILLA=/home/gbg/.mozilla

if [ -e "$MOZILLA" ]; then
    if [ ! -L "$MOZILLA" ]
    then
        echo "Firefox-Profil sichern."
        mv $MOZILLA $MNT
    else
        echo "Das Firefox-Profil muss nicht gesichert werden."
    fi
else
  echo "=> Es existiert kein Firefox-Profil."
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

#PKI-Ordner sichern
PKI=/home/gbg/.pki
if [ -e "$PKI" ]; then
    if [ ! -L "$PKI" ]
    then
        echo "pki sichern."
        cp -r $PKI $MNT
    else
        echo "Die PKI muss nicht gesichert werden."
    fi
else
  echo "=> Es existiert kein pki-Ordner."
fi

#Local-Ordner sichern
LOCAL=/home/gbg/.local
if [ -e "$LOCAL" ]; then
    if [ ! -L "$LOCAL" ]
    then
        echo "LOCAL sichern."
        cp -r $LOCAL $MNT
    else
        echo "Die LOCAL muss nicht gesichert werden."
    fi
else
  echo "=> Es existiert kein LOCAL-Ordner."
fi

#Cache-Ordner sichern
CACHE=/home/gbg/.cache
if [ -e "$CACHE" ]; then
    if [ ! -L "$CACHE" ]
    then
        echo "CACHE sichern."
        cp -r $CACHE $MNT
    else
        echo "Die CACHE muss nicht gesichert werden."
    fi
else
  echo "=> Es existiert kein CACHE-Ordner."
fi

#Verschlüsseltes Dateisystem aushängen
#-l force umount
/bin/umount -l $MNT
/sbin/cryptsetup luksClose $CRYPTNAME
/sbin/losetup -d $LOOPDEV
