#
# Regular cron jobs for the dateiablage package
#
0 4	* * *	root	[ -x /usr/bin/dateiablage_maintenance ] && /usr/bin/dateiablage_maintenance
