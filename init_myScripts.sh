#!/bin/sh
#/etc/init.d/init_myScripts.sh

### BEGIN INIT INFO
# Provides:          init_myScripts.sh
# Required-Start:    
# Required-Stop:     
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Daemon for starting your custom scripts located
#                    at /home/<USER>/scripts and forcing to end all
#                    ssh connections to Pine during reboots or poweroff
### END INIT INFO

case "$1" in
	start)
	  echo "Starting battery keeper" | wall
	  ./home/pine/scripts/battery_keeper.sh &
	  ;;
	stop)
	  echo "System is going down, closing all connections" | wall
	  killall battery_keeper
          killall sshd
	  ;;
	*)
	  exit 1
	  ;;
esac

exit 0

