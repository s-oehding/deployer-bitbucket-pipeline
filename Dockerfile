FROM ubuntu:16.04

# Switch to root to install some system-wide stuff
USER root

RUN apt-cache search php
RUN apt-get install php7
RUN apt-get install php7-ctype
RUN apt-get install php7-curl
RUN apt-get install php7-dom
RUN apt-get install php7-json
RUN apt-get install php7-mbstring
RUN apt-get install php7-openssl
RUN apt-get install php7-phar
RUN apt-get install php7-xml
RUN ln -s /usr/bin/php7 /usr/bin/php

# Composer
ENV COMPOSER_VERSION 1.3.2
RUN curl -sSL https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

# Deployer
RUN curl -L https://deployer.org/releases/v4.3.0/deployer.phar -o /usr/local/bin/dep

# Make all binaries executable
RUN chmod +x /usr/local/bin/*