#!/bin/bash
set -x
git clone git@github.com:setschedule/set-desktop.git
docker build -t stgdesktop .
docker ps --filter "status=exited" | cut -d' ' -f1 | grep -v CONTAINER | xargs -n1 docker rm
docker image prune --force
DesktopContainer=$(docker ps --all --filter "name=stgdesktop1" | wc -l)
if [ $DesktopContainer -gt 1 ]
then
  docker stop stgdesktop1
  docker rm stgdesktop1
fi
docker run -d -it --name stgdesktop1 -p 3000:3000 stgdesktop
