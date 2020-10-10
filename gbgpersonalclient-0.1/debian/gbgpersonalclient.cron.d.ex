#
# Regular cron jobs for the gbgpersonalclient package
#
0 4	* * *	root	[ -x /usr/bin/gbgpersonalclient_maintenance ] && /usr/bin/gbgpersonalclient_maintenance
