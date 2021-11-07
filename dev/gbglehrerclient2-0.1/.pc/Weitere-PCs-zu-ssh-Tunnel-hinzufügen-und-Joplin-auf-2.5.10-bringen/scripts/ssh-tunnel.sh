#!/bin/bash

if ! NAME=$(zenity --entry --text "IServ-Benutzername:" --title "Nutzername"); then
  exit;
fi
if ! IP=$(zenity --entry --title "Rechner auswählen" --text "Bitte wähle die IP-Adresse aus" 10.2.200.7 10.2.200.5 10.2.200.1 10.2.200.2); then
  exit;
fi
#ssh-Tunnel herstellen
ssh -o StrictHostKeyChecking=no -M -S CONTROL_SOCKET -fnNT $NAME@gbg-seelze.eu -L 8000:$IP:3389
#Verbindung mit Remmina herstellen
printf "[remmina]
password=
gateway_username=
window_height=525
ssh_tunnel_loopback=0
serialname=
printer_overrides=
name=Windows über ssh-Tunnel
console=0
colordepth=64
security=
precommand=
disable_fastpath=0
postcommand=
group=
server=localhost:8000
glyph-cache=0
ssh_tunnel_enabled=0
disableclipboard=0
parallelpath=
cert_ignore=0
serialpermissive=0
gateway_server=
protocol=RDP
old-license=0
ssh_tunnel_password=
resolution_mode=1
disableautoreconnect=0
loadbalanceinfo=
clientbuild=
clientname=
resolution_width=0
relax-order-checks=0
username=$NAME
gateway_domain=
serialdriver=
domain=
gateway_password=
smartcardname=
exec=
serialpath=
enable-autostart=0
shareprinter=0
shareparallel=0
disablepasswordstoring=0
quality=0
viewmode=4
parallelname=
ssh_tunnel_passphrase=
ssh_tunnel_auth=2
shareserial=0
sharefolder=
sharesmartcard=0
ssh_tunnel_username=
resolution_height=0
useproxyenv=0
microphone=0
gwtransp=http
window_maximize=0
execpath=
ignore-tls-errors=1
ssh_tunnel_server=
gateway_usage=0
window_width=851
sound=off
ssh_tunnel_privatekey=" > ~/config.remmina
remmina -c ~/config.remmina
#ssh-Tunnel schließen
ssh -S CONTROL_SOCKET -O exit $NAME@gbg-seelze.eu
