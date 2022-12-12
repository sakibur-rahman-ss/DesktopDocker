#!/bin/bash
set -x
if [ ! -d set-desktop ]
then
  git clone git@github.com:setschedule/set-desktop.git
fi
cd set-desktop
git branch
git checkout $BranchName
git pull
cd ..
docker build -t stgdesktop .
ExitedContainer=$(docker ps --filter "status=exited" | wc -l)
if [ $ExitedContainer -gt 1 ]
then
  docker ps --filter "status=exited" | cut -d' ' -f1 | grep -v CONTAINER | xargs -n1 docker rm
fi

DesktopContainer=$(docker ps --all --filter "name=stgdesktop1" | wc -l)
if [ $DesktopContainer -gt 1 ]
then
  docker stop stgdesktop1
  docker rm stgdesktop1
fi
docker run -d --name stgdesktop1 -p 3000:3000 stgdesktop
