FROM php:8.3-cli-bookworm
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
COPY rootfs .
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends parallel unzip wget \
    && install-php-extensions decimal gd intl mongodb pcntl pdo_mysql pdo_pgsql pdo_sqlite rdkafka redis sockets swoole xdebug \
    && install-tools
