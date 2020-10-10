#
# Regular cron jobs for the gbgsusclient package
#
0 4	* * *	root	[ -x /usr/bin/gbgsusclient_maintenance ] && /usr/bin/gbgsusclient_maintenance
