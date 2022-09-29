FROM ubuntu
RUN apt update
RUN apt-get -y install curl
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm@latest
COPY set-desktop /set-desktop
WORKDIR /set-desktop
RUN sed -i 's/dev.setschedule.com/dockerapi.setschedule.com/g' apis/base.js
RUN sed -i 's/dev.setschedule.com/dockerapi.setschedule.com/g' helpers/apis.js
RUN npm ci --legacy-peer-deps
EXPOSE 3000
COPY docker-entrypoint.sh ./
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["npm", "run", "start"]
