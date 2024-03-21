FROM mcr.microsoft.com/devcontainers/php:8.3
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends parallel \
    && install-php-extensions decimal gd intl mongodb pcntl pdo_mysql pdo_pgsql pdo_sqlite rdkafka redis sockets swoole
