#
# Regular cron jobs for the gbglzclient package
#
0 4	* * *	root	[ -x /usr/bin/gbglzclient_maintenance ] && /usr/bin/gbglzclient_maintenance
