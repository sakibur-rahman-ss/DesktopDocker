FROM ubuntu
RUN apt update
RUN apt-get -y install curl build-essential
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
COPY set-desktop /set-desktop
WORKDIR /set-desktop
RUN sed -i 's/dev.setschedule.com/dockerapi.setschedule.com/g' apis/base.js
RUN sed -i 's/dev.setschedule.com/dockerapi.setschedule.com/g' helpers/apis.js
RUN npm ci
RUN npm run build --legacy-peer-deps
EXPOSE 3000
ENTRYPOINT HOST=0.0.0.0 PORT=3000 node server/index.js
