#
# Regular cron jobs for the gbglehrerclient package
#
0 4	* * *	root	[ -x /usr/bin/gbglehrerclient_maintenance ] && /usr/bin/gbglehrerclient_maintenance
