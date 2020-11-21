#!/bin/bash

#Modus 1920x1080 Pixel
#		ggf. anpassen		ggf. anpassen		Beamerauflösung
#für E14 HDMI-2
xrandr --output eDP-1 --rate 60 --mode 1920x1080 --fb 1920x1080 --panning 1920x1080* --output HDMI-2 --mode 1920x1080 --same-as eDP-1
