#!/bin/bash
#Wireguard-Keys erzeugen
wg genkey | sudo tee /etc/wireguard/privatekey | wg pubkey | sudo tee /etc/wireguard/publickey

#Wireguard starten
#sudo wg-quick up wg0
#Wireguard als Service mit Systemd starten
#systemctl enable wg-quick@wg0.service
#systemctl daemon-reload
