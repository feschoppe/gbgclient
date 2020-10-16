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

#gnome-network-displays installieren, falls nicht vorhanden

#Prüfen, ob gnome-network-displays bereits vorhanden ist und falls nicht installieren

if [ -L /var/lib/flatpak/exports/bin/org.gnome.NetworkDisplays ]; then
	echo "gnome-network-displays ist bereits installiert!"
else
	echo "gnome-network-displays muss installiert werden!"
	flatpak install --from https://dl.flathub.org/repo/appstream/org.gnome.NetworkDisplays.flatpakref --noninteractive --assumeyes
fi

#Klett-Sprachen-App installieren!
if [ -f /opt/sprachenapp.zip ]; then
   echo "Die Klett-Sprachen-App ist vorhanden!"
else
   echo "--------------"
   echo "Die Klett-Sprachen-App ist NICHT vorhanden!"
   echo "--------------"
   echo "Die Klett-Sprachen-App wird heruntergeladen und installiert!"
   echo "--------------"
   wget https://www.klett-sprachen.de/downloads/21582/Linux/zip -O /opt/sprachenapp.zip
   unzip /opt/sprachenapp.zip -d /opt/
   dpkg -i /opt/klett-sprachen_1.12.0_amd64.deb   
fi

#http://schoppemail.de/deb/wpasupplicant_2.9-1ubuntu4.1-PATCHED_amd64.deb
#wpasupplicant fixen

if [ -f /opt/wpasupplicant_2.9-1ubuntu4.1-PATCHED_amd64.deb ]; then
   echo "wpa_supplicant schon gefixt."
else
   echo "--------------"
   echo "Fix von wpa_supplicant installieren."
   echo "--------------"
   wget http://schoppemail.de/deb/wpasupplicant_2.9-1ubuntu4.1-PATCHED_amd64.deb -O /opt/wpasupplicant_2.9-1ubuntu4.1-PATCHED_amd64.deb
   dpkg -i /opt/wpasupplicant_2.9-1ubuntu4.1-PATCHED_amd64.deb
fi

#SNAPS

#snaps aktualisieren
#snap refresh
#fractal installieren
#snap install fractal
