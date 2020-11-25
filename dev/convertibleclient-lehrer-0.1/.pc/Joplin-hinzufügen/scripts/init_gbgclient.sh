#!/bin/sh
#Dieses Skript setzt alle Verbindungen zurück und definiert das Aussehen des GBG-Desktops

#Deutsches Tastaturlayout einstellen (insb. bei Live-System relevant)
setxkbmap de
#Hintergrundbild setzen
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/GBG_Custom_Background.png

#Aussehen des Docks einstellen
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop','MountPrivateContainer.desktop','UMountPrivateContainer.desktop','firefox.desktop','geary.desktop','updater.desktop','libreoffice-writer.desktop','libreoffice-calc.desktop','libreoffice-impress.desktop','google-chrome.desktop','bibox2.desktop','cheese.desktop','com.github.xournalpp.xournalpp.desktop','beamer.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30
#Tap to click
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
#Ruhezustand bei Druck auf Ein-/Ausschalter
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'suspend'

#Warnung ausgeben
notify-send "Auf diesem Gerät werden keine Daten lokal gespeichert!"

#Aufruf des Skripts zum Zurücksetzen der Verbindungen
#python /usr/bin/delete_connections.py

#Root-Skript zur weiteren Systemeinrichtung starten
sudo /usr/bin/root_init_gbgclient.sh
