#!/bin/sh
#Konfiguration für 5 GHz kopieren
#Quelle: https://ubuntuforums.org/showthread.php?t=2442177

cp /opt/activate-5-Ghz.txt /etc/modprobe.d/iwlwifi.conf
reboot
