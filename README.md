# Der gbgclient

Der gbgclient ist eine Sammlung von Debian-Packages, die ein standardmäßiges Ubuntu 20.04 LTS so konfigurieren, dass mehrere Anwendungsfälle unterschieden werden können. Dieses sind insbesondere die Benutzung eines Computers durch Schülerinnen und Schüler als **geteiltes Gerät** (zum Beispiel Leihgeräte in Laptopwagen), die Benutzung durch Schülerinnen und Schüler als **persönliches Leihgerät** in der Langzeitausleihe und die Benutzung eines Geräts durch Lehrerinnen und Lehrer als **persönliches Dienstgerät**.

Die für die drei Anwendungsfälle jeweils erforderliche Gerätekonfiguration wird durch die Installation eines Debian-Packages hergestellt. Diese Debian-Packages entsprechen somit Konfigurationsprofilen.

Jedes Konfigurationsprofil enthält einen Updater, der es den Nutzerinnen und Nutzern ermöglicht, das Gerät ohne Kenntnis und Eingabe eines root-Passworts zu aktualisieren. Im Zuge dieser Aktualisierung wird jedes Mal geprüft, ob es eine neuere Version des gbgclients gibt. Liegt eine aktuellere Version vor, so wird diese automatisch installiert. Damit ist es möglich auch nachträglich die Konfiguration eines Systems zu ändern.

Allen Konfigurationsprofilen ist gemeinsam, dass sie auch das Aussehen des Systems (z.B. Bildschirmhintergrund, Dock, ...) konfigurieren. Zusätzlich enthalten die Profile auch die Konfiguration von Firefox (mit der Standardsuchmaschine DuckDuckGo und anderen Einstellungen).

# Voraussetzungen für die Installation des gbgclients

Um den gbgclient installieren zu können, müssen folgende Voraussetzungen erfüllt sein:

* Es muss ein Benutzer mit dem Namen "gbg" vorhanden sein.
* Der Benutzer "gbg" muss Mitglied in den entsprechenden Linux-Systemgruppen sein, die den Zugriff auf externe Speichermedien usw. regeln, damit man das System dann auch uneingeschränkt nutzen kann.
* Der Benutzer "gbg" muss die Bash als Shell gesetzt bekommen.

Mit den folgenden Befehlen werden diese Voraussetzungen (alle Befehle müssen mit root-Rechten ausgeführt werden) hergestellt:


```
useradd -d /tmp/gbg gbg
#Passwort für gbg setzen:
passwd gbg
#Gruppenzugehörigkeiten für gbg setzen
adduser gbg dip
adduser gbg netdev
adduser gbg plugdev
adduser gbg lpadmin
adduser gbg dialout
#bash als Default-Shell setzen
chsh -s /bin/bash gbg 
```

Langfristig soll das Herstellen dieser Ausgangskonfiguration auch noch in den gbgclient aufgenommen werden, sodass diese bei Installation des gbgclient automatisch hergestellt wird. Noch muss man das allerdings manuell machen.

Außerdem soll bei der Installation des gbgclient auch der Name des Nutzeraccounts festgelegt werden können, unter dem gearbeitet wird. Derzeit ist er 'hard coded' im gbgclient.

# Anwendungsfälle

## Anwendungsfall 1: Das geteilte Gerät - gbgclient

Im Anwendungsfall des geteilten Geräts stellt der gbgclient Folgendes sicher:

* Das Gerät setzt sich bei einem Neustart auf eine Standardkonfiguration zurück.
* Eine Installation von zusätzlichen Programmen ist nicht möglich.
* Es wird mit einem temporären Dateisystem gearbeitet.
* Es werden keine Dateien dauerhaft gespeichert.

## Anwendungsfall 2: Langfristleihe durch Schülerinnen und Schüler - gbgsusclient

Im Anwendungsfall der Langfristleihe durch Schülerinnen und Schüler stellt der gbgsusclient Folgendes sicher:

* Das Gerät setzt sich bei einem Neustart auf eine Standardkonfiguration zurück.
* Eine Installation von zusätzlichen Programmen ist nicht möglich.
* Es wird mit einem temporären Dateisystem gearbeitet.
* Es gibt einen verschlüsselten LUKS-Container (60 GB), in dem Dateien gespeichert werden können.
* Das Passwort des LUKS-Containers wird bei Übergabe des Geräts von der Schülerin/dem Schüler selber festgelegt.
* W-Lan-Passwörter werden gespeichert.

## Anwendungsfall 3: Das Dienstgerät

Im Anwendungsfall des Dienstgeräts stellt der gbglehrerclient Folgendes sicher:

* Das Gerät setzt sich bei einem Neustart auf eine Standardkonfiguration zurück.
* Eine Installation von zusätzlichen Programmen ist nicht möglich.
* Es wird mit einem temporären Dateisystem gearbeitet.
* Es gibt einen verschlüsselten LUKS-Container (60 GB), in dem Dateien gespeichert werden können.
* Das Passwort wird bei Übergabe des Geräts von der Lehrkraft festgelegt.
* Es wird automatisch ein Thunderbird-Profil zum E-Mail-Abruf angelegt und im verschlüsselten Container gespeichert.
* Die Konfiguration von Programmen wird im verschlüsselten Container gespeichert.
* Es gibt eine Möglichkeit zum automatischen Backup des Inhalts des verschlüsselten Containers auf IServ (in Entwicklung).
* W-Lan-Passwörter werden gespeichert.

# Installation

## Masseninstallation von Geräten

Zur Masseninstallation von Geräten empfehle ich die Verwendung des Programms [Cubic](https://launchpad.net/cubic). Mit Cubic kann man ein Ubuntu-ISO bearbeiten und so beispielsweise den gbgclient und andere erforderliche Programme installieren. Anschließend erzeugt man sich mit Cubic ein "custom iso", was dann den gbgclient und ggf. weitere Programme enthält. Dieses iso kann man dann auf USB-Sticks kopieren oder per PXE-Boot über das Netzwerk installieren.

## Installation des gbgclient

Der gbgclient steht in einem Launchpad-PPA zur Installation bereit:

[https://launchpad.net/~feschoppe/+archive/ubuntu/gbgclient](https://launchpad.net/~feschoppe/+archive/ubuntu/gbgclient)
