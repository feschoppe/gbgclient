#
# Regular cron jobs for the gbgclient package
#
0 4	* * *	root	[ -x /usr/bin/gbgclient_maintenance ] && /usr/bin/gbgclient_maintenance
