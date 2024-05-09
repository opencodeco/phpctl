ARG PHP_VERSION 83
ARG PHP_VERSION_STR 8.3

FROM php:${PHP_VERSION_STR}-cli-bookworm
ENV PHP_VERSION $PHP_VERSION

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
COPY rootfs .
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends parallel unzip wget \
    && install-php-extensions decimal gd intl mongodb pcntl pdo_mysql pdo_pgsql pdo_sqlite rdkafka redis sockets swoole xdebug \
    && install-tools
