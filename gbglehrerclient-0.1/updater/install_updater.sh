#!/bin/bash
#sudoers an den richtigen Ort kopieren
cp ./sudoers /etc/sudoers
#Besitzer korrekt setzen
chown root:root /etc/sudoers
#Rechte richtig setzen
chmod 0440 /etc/sudoers
#Update-Skript nach /usr/local/bin kopieren
cp ./updater.sh /usr/local/bin/updater.sh
#Rechte richtig setzen
chmod 0755 /usr/local/bin/updater.sh
#*.desktop-Datei nach /usr/share/applications kopieren, damit es
#im Startmenü von gnome auftaucht
cp ./updater.desktop /usr/share/applications/
#Icon nach /usr/share/icons kopieren
cp ./updater.svg /usr/share/icons
#Rechte richtig setzen
chmod 755 /usr/share/icons/updater.svg
#delete_connections.sh aktualisieren, damit der Starter
#im GBG-Linux-Dock auftaucht
cp ./delete_connections.sh /usr/local/bin/
