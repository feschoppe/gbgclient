#
# Regular cron jobs for the convertibleclient-lehrer package
#
0 4	* * *	root	[ -x /usr/bin/convertibleclient-lehrer_maintenance ] && /usr/bin/convertibleclient-lehrer_maintenance
