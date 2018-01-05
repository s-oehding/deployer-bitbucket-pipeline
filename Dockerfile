FROM 1and1internet/ubuntu-16-apache-php-7.1:latest

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
