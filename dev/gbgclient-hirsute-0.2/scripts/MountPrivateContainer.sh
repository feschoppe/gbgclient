#!/bin/sh

SAFE=/opt/PrivateContainer
CRYPTNAME=PrivateContainer
MNT=/opt/mount/PrivateContainer
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

#Container verlinken

mount --bind --verbose $MNT /tmp/gbg

#ggf. Unterordner im user home anlegen

if [ -d /tmp/gbg/Dokumente ]; then
	echo "Dokumente existiert."
else
	echo "Dokumente existiert nicht."
	mkdir /tmp/gbg/Dokumente
fi

if [ -d /tmp/gbg/Downloads ]; then
	echo "Downloads existiert."
else
	echo "Downloads existiert nicht."
	mkdir /tmp/gbg/Downloads
fi

if [ -d /tmp/gbg/Bilder ]; then
	echo "Bilder existiert."
else
	echo "Bilder existiert nicht."
	mkdir /tmp/gbg/Bilder
fi

if [ -d /tmp/gbg/Musik ]; then
	echo "Musik existiert."
else
	echo "Musik existiert nicht."
	mkdir /tmp/gbg/Musik
fi

if [ -d /tmp/gbg/Schreibtisch ]; then
	echo "Schreibtisch existiert."
else
	echo "Schreibtisch existiert nicht."
	mkdir /tmp/gbg/Schreibtisch
fi

if [ -d /tmp/gbg/Videos ]; then
	echo "Videos existiert."
else
	echo "Videos existiert nicht."
	mkdir /tmp/gbg/Videos
fi

if [ -d /tmp/gbg/Vorlagen ]; then
	echo "Vorlagen existiert."
else
	echo "Vorlagen existiert nicht."
	mkdir /tmp/gbg/Vorlagen
fi

if [ -d /tmp/gbg/Öffentlich ]; then
	echo "Öffentlich existiert."
else
	echo "Öffentlich existiert nicht."
	mkdir /tmp/gbg/Öffentlich
fi

if ! NAME=$(zenity --entry --text "IServ-Benutzername:" --title "Nutzername"); then
  exit;
fi

sed "s/\__NUTZERNAME/$NAME/g" /etc/skel/.templates/bookmarks_TEMPLATE > /tmp/gbg/.config/gtk-3.0/bookmarks

chown -R gbg:gbg $MNT
