#!/bin/bash
#Dieses Skript muss als root ausgeführt werden!
#Anpassen der /etc/sudoers/
#gbg ALL = NOPASSWD: /usr/bin/root_init_gbgclient.sh

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
chmod 755 /tmp/gbg/.config/mimeapps.list

if ! NAME=$(zenity --entry --text "IServ-Benutzername:" --title "Nutzername"); then
  exit;
fi

#if ! PASS=$(zenity --entry --hide-text --text "IServ-Passwort:" --title "Passwort"); then
#  exit;
#fi

sed "s/\__NUTZERNAME/$NAME/g" /etc/skel/.templates/bookmarks_TEMPLATE > /tmp/gbg/.config/gtk-3.0/bookmarks

