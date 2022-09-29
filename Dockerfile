FROM ubuntu
RUN apt update
RUN apt -y install curl
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt install -y nodejs build-essential apache2 python3-certbot-apache certbot
RUN npm install -g npm@latest
