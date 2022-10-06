FROM ubuntu
RUN apt update
RUN apt-get -y install curl
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm@latest
RUN npm install -g forever
COPY set-desktop /set-desktop
WORKDIR /set-desktop
RUN sed -i 's/dev.setschedule.com/dockerapi.setschedule.com/g' apis/base.js
RUN sed -i 's/dev.setschedule.com/dockerapi.setschedule.com/g' helpers/apis.js
RUN npm ci --legacy-peer-deps
RUN npm run build
EXPOSE 3000
ENTRYPOINT HOST=0.0.0.0 PORT=3000 node server/index.js
