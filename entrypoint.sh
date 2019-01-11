#! /bin/sh

Xvfb ${DISPLAY} -ac -listen tcp -screen 0 1024x768x16 &
sleep 1
/usr/bin/fluxbox -display ${DISPLAY} -screen 0 &
sleep 1
DISPLAY=${DISPLAY} xterm -T "dfhack" -e /df_linux/dfhack &
sleep 1
x11vnc -display ${DISPLAY}.0 -forever -passwd ${VNC_PASSWORD:-password} &
sleep 1
/usr/src/app/noVNC/utils/launch.sh --vnc localhost:5900
