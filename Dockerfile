FROM ubuntu:17.10

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive \
        apt-get install -q -y php7.2 \
        php7.2-fpm \
        imagemagick \
        php-memcached \
        php7.2-soap \
        php7.2-cli \
        php7.2-curl \
        php7.2-dev \
        php7.2-gd \
        php7.2-mcrypt \
        php7.2-zip \
        php7.2-xsl \
        php7.2-odbc \
        php7.2-mbstring \
        php-pear \
        php7.2-intl \
        php7.2-mysql \
        php-imagick \
        openssh-client \
        git \
        python-software-properties

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive \
        apt-get install -q -y nodejs

RUN npm install -g bower

# Composer
RUN curl -sSL https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

# Deployer
RUN curl -LO https://deployer.org/deployer.phar -o /usr/local/bin/dep

# Make all binaries executable
RUN chmod +x /usr/local/bin/*

CMD ["php-fpm7.2"]
