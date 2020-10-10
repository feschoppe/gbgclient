#!/bin/bash
#Dieses Skript ermöglicht, dem Benutzer 'gbg' ohne Passworteingabe Updates zu installieren,
#da er in der /etc/sudoers das Recht hat, /usr/local/bin/updater.sh mit sudo ohne Passwort-
#Eingabe auszuführen.
sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get autoremove -y

#element-desktop installieren, falls nicht vorhanden

FILE=/usr/share/keyrings/riot-im-archive-keyring.gpg

if [ -f $FILE ]; then
   echo "Der element.io-Keyring ist vorhanden. Keine Installation nötig!"
else
   echo "Der element.io-Keyring ist NICHT vorhanden."
   DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https
   wget -O /usr/share/keyrings/riot-im-archive-keyring.gpg https://packages.riot.im/debian/riot-im-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/riot-im-archive-keyring.gpg] https://packages.riot.im/debian/ default main" | tee /etc/apt/sources.list.d/riot-im.list
   apt update
   DEBIAN_FRONTEND=noninteractive apt-get install -y element-desktop
fi

#snaps aktualisieren
#snap refresh
#fractal installieren
#snap install fractal
