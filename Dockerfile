FROM ubuntu
RUN apt update
RUN apt-get -y install curl
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm@latest
COPY set-desktop /set-desktop
COPY docker-entrypoint.sh /set-desktop
WORKDIR /set-desktop
RUN sed -i 's/dev.setschedule.com/dockerapi.setschedule.com/g' apis/base.js
RUN sed -i 's/dev.setschedule.com/dockerapi.setschedule.com/g' helpers/apis.js
RUN npm ci --legacy-peer-deps
RUN npm run build
EXPOSE 3000
ENTRYPOINT NODE_ENV=production forever start --minUptime 1000 --spinSleepTime 5000 -a -l forever.log -o out.log -e err.log --loglevel debug server/index.js
