#!/bin/bash
set -x
git clone git@github.com:setschedule/set-desktop.git
ls -lh
docker build -t stgdesktop .
