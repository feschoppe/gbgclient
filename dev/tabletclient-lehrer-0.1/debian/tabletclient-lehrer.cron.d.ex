#
# Regular cron jobs for the tabletclient-lehrer package
#
0 4	* * *	root	[ -x /usr/bin/tabletclient-lehrer_maintenance ] && /usr/bin/tabletclient-lehrer_maintenance
