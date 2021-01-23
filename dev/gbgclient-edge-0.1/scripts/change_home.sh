#!/bin/bash
#Dieses Skript sorgt dafür, dass snaps starten
echo "/tmp /home none bind" >> /etc/fstab
OldHome='\/tmp\/gbg'
NewHome='\/home\/gbg'
sed -i "s/$OldHome/$NewHome/g" /etc/passwd
reboot
