#!/bin/bash
#Dieses Skript muss als root ausgeführt werden!
#chown root:root nutzerdatenerfassung.sh
#Anpassen der /etc/sudoers/
#gbg ALL = NOPASSWD: /usr/local/bin/nutzerdatenerfassung.sh

cp -r /etc/skel/.mozilla /tmp/gbg/
chown -R gbg:gbg /tmp/gbg/.mozilla
chmod 755 -R /tmp/gbg/.mozilla

cp -r /etc/skel/.atom /tmp/gbg/
chown -R gbg:gbg /tmp/gbg/.atom
chmod 755 -R /tmp/gbg/.atom

cp -r /etc/skel/.config/chromium /tmp/gbg/.config/
chown -R gbg:gbg /tmp/gbg/.config/chromium
chmod 755 -R /tmp/gbg/.config/chromium

cp -r /etc/skel/.config/google-chrome /tmp/gbg/.config/google-chrome
chown -R gbg:gbg /tmp/gbg/.config/google-chrome
chmod 755 -R /tmp/gbg/.config/google-chrome

mkdir /tmp/gbg/public_html
chown -R gbg:gbg /tmp/gbg/public_html
chmod 755 -R /tmp/gbg/public_html
rm /opt/lampp/htdocs/gbg
ln -s /tmp/gbg/public_html /opt/lampp/htdocs/gbg

#Standardanwendungen korrekt einstellen
cp /etc/skel/.config/mimeapps.list /tmp/gbg/.config/
chown gbg:gbg /tmp/gbg/.config/mimeapps.list
chmod 777 /tmp/gbg/.config/mimeapps.list

#x2go-Config für den Zeugnisserver kopieren
cp -r /etc/skel/.x2goclient /tmp/gbg/
chown -R gbg:gbg /tmp/gbg/.x2goclient
chmod 755 -R /tmp/gbg/.x2goclient
