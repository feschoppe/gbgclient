#
# Regular cron jobs for the gbglehrerclient2 package
#
0 4	* * *	root	[ -x /usr/bin/gbglehrerclient2_maintenance ] && /usr/bin/gbglehrerclient2_maintenance
