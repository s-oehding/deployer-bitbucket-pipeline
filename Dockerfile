FROM docksal/bitbucket-pipelines-agent:edge

# Switch to root to install some system-wide stuff
USER root

RUN apk add --update --no-cache \
    php7 \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-json \
    php7-mbstring \
    php7-openssl \
    php7-phar \
    php7-xml \
    && rm -rf /var/cache/apk/* \
    && ln -s /usr/bin/php7 /usr/bin/php

# Composer
ENV COMPOSER_VERSION 1.3.2
RUN curl -sSL "https://github.com/composer/composer/releases/download/${COMPOSER_VERSION}/composer.phar" -o /usr/local/bin/composer

# Deployer
RUN curl -LO https://deployer.org/deployer.phar
RUN mv deployer.phar /usr/local/bin/dep

# Make all binaries executable
RUN chmod +x /usr/local/bin/*