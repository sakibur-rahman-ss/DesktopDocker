#!/bin/bash
set -x
git clone git@github.com:setschedule/set-desktop.git
docker build -t stgdesktop .
docker ps --filter "status=exited" | cut -d' ' -f1 | grep -v CONTAINER | xargs -n1 docker rm
DesktopContainer=$(docker ps --all --filter "name=stgdesktop1" | wc -l)
echo $DesktopContainer
docker run -d --name stgdesktop1 -p 3000:3000 stgdesktop
