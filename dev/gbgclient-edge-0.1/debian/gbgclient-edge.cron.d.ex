#
# Regular cron jobs for the gbgclient-edge package
#
0 4	* * *	root	[ -x /usr/bin/gbgclient-edge_maintenance ] && /usr/bin/gbgclient-edge_maintenance
