#!/bin/bash
#Dieses Skript ermöglicht, dem Benutzer 'gbg' ohne Passworteingabe Updates zu installieren,
#da er in der /etc/sudoers das Recht hat, /usr/local/bin/updater.sh mit sudo ohne Passwort-
#Eingabe auszuführen.
sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get autoremove -y

#element-desktop installieren, falls nicht vorhanden

FILE=/usr/share/keyrings/riot-im-archive-keyring.gpg

if [ -f $FILE ]; then
   echo "Der element.io-Keyring ist vorhanden. Keine Installation nötig!"
else
   echo "Der element.io-Keyring ist NICHT vorhanden."
   DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https
   wget -O /usr/share/keyrings/riot-im-archive-keyring.gpg https://packages.riot.im/debian/riot-im-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/riot-im-archive-keyring.gpg] https://packages.riot.im/debian/ default main" | tee /etc/apt/sources.list.d/riot-im.list
   apt update
   DEBIAN_FRONTEND=noninteractive apt-get install -y element-desktop
fi

#gnome-network-displays installieren, falls nicht vorhanden

#Prüfen, ob gnome-network-displays bereits vorhanden ist und falls nicht installieren

if [ -L /var/lib/flatpak/exports/bin/org.gnome.NetworkDisplays ]; then
	echo "gnome-network-displays ist bereits installiert!"
else
	echo "gnome-network-displays muss installiert werden!"
	flatpak install --from https://dl.flathub.org/repo/appstream/org.gnome.NetworkDisplays.flatpakref --noninteractive --assumeyes
fi

#Klett-Sprachen-App Version 2.2 installieren!
if [ -f /opt/sprachenapp_v2.zip ]; then
   echo "Die Klett-Sprachen-App ist vorhanden!"
else
   echo "--------------"
   echo "Die Klett-Sprachen-App ist NICHT vorhanden!"
   echo "--------------"
   echo "Die Klett-Sprachen-App wird heruntergeladen und installiert!"
   echo "--------------"
   wget https://www.klett-sprachen.de/downloads/21582/Linux/zip -O /opt/sprachenapp_v2.zip
   unzip /opt/sprachenapp_v2.zip -d /opt/
   dpkg -i /opt/klett-sprachen_2.2.0_amd64.deb
fi

#Prüfen, ob xournalpp vorhanden ist, falls ja,
#entfernen und neu installieren

REQUIRED_PKG="xournalpp"

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt install xournalpp -y
else
  echo "xournalpp ist vorhanden!"
  #Vorhandene xournalpp-Installation entfernen
  #apt remove xournalpp -y
  #Vorhandene Installation von xournal entfernen
  #apt remove xournal -y
  #xournalpp neu installieren
  #apt install xournalpp -y
fi

#BiBox installieren!
if [ -f /opt/BiBox20210630.deb ]; then
   echo "Die BiBox ist vorhanden."
else
   echo "--------------"
   echo "Die BiBox ist NICHT vorhanden!"
   echo "--------------"
   echo "Die BiBox wird heruntergeladen und installiert!"
   echo "--------------"
   wget https://static.bibox2.westermann.de/apps/linux -O /opt/BiBox20210630.deb
   dpkg -i /opt/BiBox20210630.deb
   #wget http://schoppemail.de/deb/bibox2.desktop -O /usr/share/applications/bibox2.desktop
   #chmod 755 /usr/share/applications/bibox2.desktop
fi


#P3X OneNote aktualisieren!
if [ -f /opt/p3x-onenote_2022.4.104_amd64.deb ]; then
   echo "P3X OneNote Version 2022.4.104 ist vorhanden"
else
   echo "--------------"
   echo "P3X OneNote Version 2022.4.104 ist NICHT vorhanden!"
   echo "--------------"
   echo "P3X OneNote wird heruntergeladen und installiert!"
   echo "--------------"
   wget https://github.com/patrikx3/onenote/releases/download/v2022.4.104/p3x-onenote_2022.4.104_amd64.deb -O /opt/p3x-onenote_2022.4.104_amd64.deb
   dpkg -i /opt/p3x-onenote_2022.4.104_amd64.deb
fi

#Joplin auf Version 2.6.10 aktualisieren
if [ -f /usr/local/bin/Joplin-2.6.10.AppImage ]; then
   echo "Joplin 2.6.10 ist vorhanden."
else
   echo "--------------"
   echo "Joplin 2.6.10 ist NICHT vorhanden!"
   echo "--------------"
   echo "Joplin 2.6.10 wird heruntergeladen und installiert!"
   echo "--------------"
   wget https://github.com/laurent22/joplin/releases/download/v2.6.10/Joplin-2.6.10.AppImage -O /usr/local/bin/Joplin-2.6.10.AppImage
   cp /usr/local/bin/Joplin-2.6.10.AppImage /usr/local/bin/Joplin.AppImage
   chmod +x /usr/local/bin/Joplin.AppImage
   if [ -f /usr/local/bin/Joplin-2.5.10.AppImage ]; then
      echo "Joplin 2.5.10 ist noch vorhanden und muss entfernt werden."
      rm /usr/local/bin/Joplin-2.5.10.AppImage
   else
      echo "Joplin 2.5.10 muss nicht entfernt werden."
   fi
fi

#SweetHome3D Version 6.6 installieren
if [ -f /usr/local/bin/SweetHome3D.tgz ]; then
   echo "SweetHome3D Version 6.6 ist vorhanden!"
else
   echo "--------------"
   echo "SweetHome3D Version 6.6 ist nicht vorhanden!"
   echo "--------------"
   echo "SweetHome3D Version 6.6 wird heruntergeladen und installiert!"
   echo "--------------"
   wget https://downloads.sourceforge.net/project/sweethome3d/SweetHome3D/SweetHome3D-6.6/SweetHome3D-6.6-linux-x64.tgz -O /usr/local/bin/SweetHome3D.tgz
   tar -xvzf /usr/local/bin/SweetHome3D.tgz -C /usr/local/bin/
   chmod -R 755 /usr/local/bin/SweetHome3D-6.6/
   chmod +x /usr/local/bin/SweetHome3D-6.6/SweetHome3D
   echo "[Desktop Entry]" > /usr/share/applications/SweetHome3D.desktop
   echo "Version=6.6" >> /usr/share/applications/SweetHome3D.desktop
   echo "Name=SweetHome3D" >> /usr/share/applications/SweetHome3D.desktop
   echo "Exec=/usr/local/bin/SweetHome3D-6.6/SweetHome3D" >> /usr/share/applications/SweetHome3D.desktop
   echo "Path=/usr/local/bin/SweetHome3D-6.6" >> /usr/share/applications/SweetHome3D.desktop
   echo "Icon=/usr/local/bin/SweetHome3D-6.6/SweetHome3DIcon.png" >> /usr/share/applications/SweetHome3D.desktop
   echo "Terminal=false" >> /usr/share/applications/SweetHome3D.desktop
   echo "Type=Application" >> /usr/share/applications/SweetHome3D.desktop
   echo "Categories=Application;Development;" >> /usr/share/applications/SweetHome3D.desktop
   chmod 755 /usr/share/applications/SweetHome3D.desktop
fi

#Skype installieren
if [ -f /opt/skypeforlinux-64.deb ]; then
   echo "Skype ist vorhanden."
else
   echo "--------------"
   echo "Skype ist NICHT vorhanden!"
   echo "--------------"
   echo "Skype wird heruntergeladen und installiert!"
   echo "--------------"
   wget https://go.skype.com/skypeforlinux-64.deb -O /opt/skypeforlinux-64.deb
   dpkg -i /opt/skypeforlinux-64.deb
fi

#Signal installieren

#Prüfen, ob problematsicher Key vorhanden ist
#der ggf. entfernt werden muss
#/etc/apt/sources.list.d/home:Vogtinator:firebird-emu.list
#/etc/apt/trusted.gpg.d/home\:Vogtinator\:firebird-emu.gpg

if [ -f /etc/apt/sources.list.d/home:Vogtinator:firebird-emu.list ]; then
   echo "firebird-emu.list entfernen"
   rm /etc/apt/sources.list.d/home:Vogtinator:firebird-emu.list
   rm /etc/apt/trusted.gpg.d/home\:Vogtinator\:firebird-emu.gpg
fi
#Signal installieren
if [ -f /etc/apt/sources.list.d/signal-xenial.list ]; then
   echo "Signal ist vorhanden!"
else
   echo "--------------"
   echo "Signal ist NICHT vorhanden!"
   echo "--------------"
   echo "Signal wird heruntergeladen und installiert!"
   echo "--------------"
   wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
   echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
   sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
   sudo DEBIAN_FRONTEND=noninteractive apt-get -y install signal-desktop
fi

#veracrypt-gui installieren!
if [ -f /opt/veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb ]; then
   echo "Veracrypt mit GUI ist vorhanden."
else
   echo "--------------"
   echo "Veracrypt mit GUI ist NICHT vorhanden!"
   echo "--------------"
   PKG_OK_VERA=$(dpkg-query -W --showformat='${Status}\n' veracrypt-console|grep "install ok installed")
   echo Checking for veracrypt-console: $PKG_OK_VERA
   if [ "" = "$PKG_OK_VERA" ]; then
      echo "Bestehende Installation von Veracrypt (Konsole) muss nicht entfernt werden."
   else
      echo "Veracrypt-Console ist vorhanden und muss entfernt werden!"
      apt remove veracrypt-console -y
   fi
   echo "Veracrypt mit GUI wird heruntergeladen und installiert!"
   echo "--------------"
   wget https://launchpad.net/veracrypt/trunk/1.24-update7/+download/veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb -O /opt/veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb
   dpkg -i /opt/veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb
fi

#calibre installieren
if [[ -d /opt/calibre ]]; then
   echo "calibre ist vorhanden."
else
   echo "calibre ist nicht vorhanden"
   echo "calibre wird installiert"
   sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
fi
