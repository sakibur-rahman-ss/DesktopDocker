#!/bin/bash
set -x
git clone git@github.com:setschedule/set-desktop.git
docker build -t stgdesktop .
docker ps --filter "status=exited" | cut -d' ' -f1 | grep -v CONTAINER | xargs -n1 docker rm
DesktopContainer=$(docker ps --all --filter "name=stgdesktop1" | wc -l)
if [ $DesktopContainer -gt 1 ]
then
  docker rm stgdesktop1
fi
docker run -d --name stgdesktop1 -p 3000:3000 stgdesktop
