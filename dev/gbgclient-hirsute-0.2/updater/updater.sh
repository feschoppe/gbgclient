#!/bin/bash
#Dieses Skript ermöglicht, dem Benutzer 'gbg' ohne Passworteingabe Updates zu installieren,
#da er in der /etc/sudoers das Recht hat, /usr/local/bin/updater.sh mit sudo ohne Passwort-
#Eingabe auszuführen.
sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get autoremove -y

#BiBox installieren!
if [ -f /opt/BiBox.deb ]; then
   echo "Die BiBox ist vorhanden."
else
   echo "--------------"
   echo "Die BiBox ist NICHT vorhanden!"
   echo "--------------"
   echo "Die BiBox wird heruntergeladen und installiert!"
   echo "--------------"
   wget https://static.bibox2.westermann.de/apps/linux -O /opt/BiBox.deb
   dpkg -i /opt/BiBox.deb
fi
