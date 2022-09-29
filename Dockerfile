FROM ubuntu
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
RUN sudo apt install -y nodejs build-essential apache2 python3-certbot-apache certbot
RUN sudo npm install -g npm@latest
