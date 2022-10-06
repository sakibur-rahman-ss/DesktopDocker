FROM ubuntu
RUN apt update
RUN apt-get -y install curl gpg
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
COPY set-desktop /set-desktop
WORKDIR /set-desktop
RUN npm ci
RUN npm run build
EXPOSE 3000
ENTRYPOINT HOST=0.0.0.0 PORT=3000 node server/index.js
