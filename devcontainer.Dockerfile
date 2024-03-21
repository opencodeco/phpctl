FROM mcr.microsoft.com/devcontainers/php:8.3
RUN apt-get update && apt-get install -y parallel && \
    curl -sSLf \
        -o /usr/local/bin/install-php-extensions \
        https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions pcntl pdo_mysql sockets swoole
