#!/bin/sh
#Dieses Skript setzt alle Verbindungen zurück und definiert das Aussehen des GBG-Desktops
setxkbmap de
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/GBG_Custom_Background.png
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop','MountPrivateContainer.desktop','UMountPrivateContainer.desktop','firefox.desktop','libreoffice-writer.desktop','libreoffice-calc.desktop','libreoffice-impress.desktop','gnome-terminal.desktop','google-chrome.desktop','openboard.desktop','Write.desktop','xournal.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30
notify-send "Auf diesem Gerät werden keine Daten lokal gespeichert!"
python /usr/bin/delete_connections.py
setxkbmap de
sudo /usr/bin/nutzerdatenerfassung.sh
