#!/bin/sh -e
### BEGIN INIT INFO
# Provides:          vncserver
# Required-Start:    networking
# Default-Start:     S
# Default-Stop:      0 6
### END INIT INFO

PATH="$PATH:/usr/X11R6/bin/"

# The Username:Group that will run VNC
export USER="cingram"
#${RUNAS}

# The display that VNC will use
#DISPLAY="1"
DISPLAY="6"

# Color depth (between 8 and 32)
#DEPTH="16"
DEPTH="32"

# The Desktop geometry to use.
#GEOMETRY="<WIDTH>x<HEIGHT>"
#GEOMETRY="800x600"
#GEOMETRY="1024x768"
#GEOMETRY="1280x1024"
GEOMETRY="3840x2160"

# The name that the VNC Desktop will have.
NAME="my-vnc-server"

OPTIONS="-localhost no -depth ${DEPTH} -geometry ${GEOMETRY} -i :${DISPLAY}"

. /lib/lsb/init-functions

case "$1" in
start)
log_action_begin_msg "Starting vncserver for user '${USER}' on localhost:${DISPLAY}"
su ${USER} -c "/usr/bin/vncserver ${OPTIONS}"
;;

stop)
log_action_begin_msg "Stoping vncserver for user '${USER}' on localhost:${DISPLAY}"
su ${USER} -c "/usr/bin/vncserver -kill :${DISPLAY}"
;;

restart)
$0 stop
$0 start
;;
esac

exit 0
