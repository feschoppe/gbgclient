#!/bin/sh

useradd -d /tmp/gbg gbg
#Passwort für gbg setzen:
#passwd gbg
#Gruppenzugehörigkeiten für gbg setzen
adduser gbg dip
adduser gbg netdev
adduser gbg plugdev
adduser gbg lpadmin
adduser gbg dialout
#bash als Default-Shell setzen
chsh -s /bin/bash gbg 
