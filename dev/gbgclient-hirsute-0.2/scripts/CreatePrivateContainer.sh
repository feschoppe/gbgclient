#!/bin/sh

SAFE=/opt/PrivateContainer
CRYPTNAME=PrivateContainer
MNT=/home/gbg/PrivateContainer
FS=ext4

#Füllen des Containers mit Zufallszahlen
echo "Der private Datencontainer wird angelegt. Bitte hab etwas Geduld. Dieser Vorgang dauert etwa 5 Minuten."
dd if=/dev/urandom of=$SAFE bs=1M count=5000 status=progress


#Ordner zum Mounten anlegen
mkdir /opt/mount
