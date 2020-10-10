#
# Regular cron jobs for the gbglehrer-testclient3 package
#
0 4	* * *	root	[ -x /usr/bin/gbglehrer-testclient3_maintenance ] && /usr/bin/gbglehrer-testclient3_maintenance
