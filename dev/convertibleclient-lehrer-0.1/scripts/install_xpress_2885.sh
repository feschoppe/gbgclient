#!/bin/bash

echo "Druckerinstallation startet!"
cd /opt/
wget https://ftp.hp.com/pub/softlib/software13/printers/SS/SL-M4580FX/uld_V1.00.39_01.17.tar.gz
tar -xzvf uld_V1.00.39_01.17.tar.gz
./uld/install.sh
