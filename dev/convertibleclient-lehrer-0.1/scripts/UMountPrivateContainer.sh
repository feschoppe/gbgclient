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

#Falls vorhanden, Thunderbird-Profil sichern
MAIL=/tmp/gbg/.thunderbird
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
MOZILLA=/tmp/gbg/.mozilla

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
CONFIG=/tmp/gbg/.config
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
PKI=/tmp/gbg/.pki
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
LOCAL=/tmp/gbg/.local
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
CACHE=/tmp/gbg/.cache
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

#.wine-Ordner sichern
WINE=/tmp/gbg/.wine
if [ -e "$WINE" ]; then
    if [ ! -L "$WINE" ]
    then
        echo ".wine sichern."
        cp -r $WINE $MNT
        rm -r $WINE
    else
        echo ".wine muss nicht gesichert werden."
    fi
else
  echo "=> Es existiert kein .wine-Ordner."
fi

rm -r /tmp/gbg/.pki
#mkdir /tmp/gbg/.pki
#chown -R gbg:gbg /tmp/gbg/.pki

rm -r /tmp/gbg/.local
mkdir /tmp/gbg/.local
chown -R gbg:gbg /tmp/gbg/.local

rm -r /tmp/gbg/.cache
mkdir /tmp/gbg/.cache
chown -R gbg:gbg /tmp/gbg/.cache

rm -r /tmp/gbg/.mozilla
cp -r /etc/skel/.mozilla /tmp/gbg/
chown -R gbg:gbg /tmp/gbg/.mozilla
chmod 755 -R /tmp/gbg/.mozilla

#Standardanwendungen korrekt einstellen
rm -r /tmp/gbg/.config
mkdir /tmp/gbg/.config
chown -R gbg:gbg /tmp/gbg/.config
cp /etc/skel/.config/mimeapps.list /tmp/gbg/.config/
chown gbg:gbg /tmp/gbg/.config/mimeapps.list
chmod 755 /tmp/gbg/.config/mimeapps.list

mkdir /tmp/gbg/.config/gtk-3.0/
chown -R gbg:gbg /tmp/gbg/.config/gtk-3.0/
sed "s/\__NUTZERNAME/$NAME/g" /etc/skel/.templates/bookmarks_TEMPLATE > /tmp/gbg/.config/gtk-3.0/bookmarks

#Verschlüsseltes Dateisystem aushängen
#-l force umount
/bin/umount -l $MNT
/sbin/cryptsetup luksClose $CRYPTNAME
/sbin/losetup -d $LOOPDEV
