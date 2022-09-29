#!/bin/bash
set -x
git clone git@github.com:setschedule/set-desktop.git
docker build -t stgdesktop .
docker run -d --name stgdesktop1 -p 3000:3000 stgdesktop
