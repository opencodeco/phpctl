ARG ALPINE=3.19
FROM alpine:${ALPINE}
ARG PHP
COPY rootfs /
RUN apk add --no-cache \
        git \
        docker-cli \
        php${PHP}-cli \
        php${PHP}-ctype \
        php${PHP}-dom \
        php${PHP}-fileinfo \
        php${PHP}-iconv \
        php${PHP}-mbstring \
        php${PHP}-mysqlnd \
        php${PHP}-openssl \
        php${PHP}-pcntl \
        php${PHP}-pdo \
        php${PHP}-pdo_mysql \
        php${PHP}-phar \
        php${PHP}-posix \
        php${PHP}-simplexml \
        php${PHP}-tokenizer \
        php${PHP}-xml \
        php${PHP}-xmlreader \
        php${PHP}-xmlwriter \
        php${PHP}-pecl-mongodb \
        php${PHP}-pecl-pcov \
        php${PHP}-pecl-rdkafka \
        php${PHP}-pecl-redis \
        php${PHP}-pecl-swoole \
        php${PHP}-pecl-xdebug \
    && ln -sf /usr/bin/php${PHP} /usr/bin/php \
    && mv /etc/php/php.ini /etc/php${PHP}/conf.d/99_phpctl.ini \
    && rm -rf /var/cache/apk/*
ENTRYPOINT [ "/usr/bin/php" ]
CMD [ "-v" ]
