FROM php:8.3-bookworm
COPY rootfs /
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends wget \
    && mv /etc/php/php.ini /usr/local/etc/php/conf.d/zzphp.ini \
    && /usr/local/bin/install-tools
