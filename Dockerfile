FROM ubuntu
RUN apt update
RUN apt-get -y install curl
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm@latest
COPY set-desktop /set-desktop
WORKDIR /set-desktop
RUN npm ci --legacy-peer-deps
