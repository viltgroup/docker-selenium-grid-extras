#!/bin/bash

export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"

function get_server_num() {
  echo $(echo $DISPLAY | sed -r -e 's/([^:]+)?:([0-9]+)(\.[0-9]+)?/\2/')
}

function shutdown {
  kill -s SIGTERM $NODE_PID
  wait $NODE_PID
}

if [ ! -z "$REMOTE_HOST" ]; then
  >&2 echo "REMOTE_HOST variable is *DEPRECATED* in these docker containers.  Please use SE_OPTS=\"-host <host> -port <port>\" instead!"
  exit 1
fi

if [ ! -z "$SE_OPTS" ]; then
  echo "appending selenium options: ${SE_OPTS}"
fi

SERVERNUM=$(get_server_num)

rm -f /tmp/.X*lock
cd $PATH_TO_SELENIUM


xvfb-run -n $SERVERNUM --server-args="-screen 0 $GEOMETRY -ac +extension RANDR" \
  java ${JAVA_OPTS} -jar $PATH_TO_SELENIUM/selenium-grid-extras.jar ${SE_OPTS} & 
NODE_PID=$!

trap shutdown SIGTERM SIGINT
wait $NODE_PID
