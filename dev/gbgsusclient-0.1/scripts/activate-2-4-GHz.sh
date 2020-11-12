#!/bin/sh
#Konfiguration für 2.4 GHz kopieren
#Quelle: https://ubuntuforums.org/showthread.php?t=2442177

cp /opt/activate-2-4-Ghz.txt /etc/modprobe.d/iwlwifi.conf
reboot
