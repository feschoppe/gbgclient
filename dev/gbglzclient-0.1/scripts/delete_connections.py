#! /usr/bin/env python

import commands
import os

res = commands.getstatusoutput("nmcli -t -f TYPE,UUID con")
lines = res[1].split('\n')

for line in lines:
    parts = line.split(":")
    if (parts[0] == "802-11-wireless"):
        os.system("nmcli connection delete uuid "+ parts[1])

print ">> Done."
os.system("nmcli connection")
