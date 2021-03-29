#
# Regular cron jobs for the gbgclient-hirsute package
#
0 4	* * *	root	[ -x /usr/bin/gbgclient-hirsute_maintenance ] && /usr/bin/gbgclient-hirsute_maintenance
