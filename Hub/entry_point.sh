#!/bin/bash

function shutdown {
  kill -s SIGTERM $NODE_PID
  wait $NODE_PID
}

if [ ! -z "$SE_OPTS" ]; then
  echo "appending selenium options: ${SE_OPTS}"
fi


cd $PATH_TO_SELENIUM


java ${JAVA_OPTS} -jar $PATH_TO_SELENIUM/selenium-grid-extras.jar ${SE_OPTS} & 
NODE_PID=$!

trap shutdown SIGTERM SIGINT
wait $NODE_PID
