FROM ubuntu
RUN apt update
RUN apt-get -y install curl apt-utils
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm@latest
