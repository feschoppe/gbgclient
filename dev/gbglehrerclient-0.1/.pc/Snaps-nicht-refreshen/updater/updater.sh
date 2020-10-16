#!/bin/bash
#Dieses Skript ermöglicht, dem Benutzer 'gbg' ohne Passworteingabe Updates zu installieren,
#da er in der /etc/sudoers das Recht hat, /usr/local/bin/updater.sh mit sudo ohne Passwort-
#Eingabe auszuführen.
sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get autoremove -y

#snaps aktualisieren
snap refresh
#fractal installieren
#snap install fractal
