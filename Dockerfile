ARG ALPINE=3.18
FROM alpine:${ALPINE}
ARG PHP
COPY rootfs /
RUN apk add --no-cache \
        php${PHP} \
        php${PHP}-dom \
        php${PHP}-iconv \
        php${PHP}-mbstring \
        php${PHP}-mysqlnd \
        php${PHP}-openssl \
        php${PHP}-pcntl \
        php${PHP}-pdo \
        php${PHP}-pdo_mysql \
        php${PHP}-phar \
        php${PHP}-posix \
        php${PHP}-tokenizer \
        php${PHP}-xml \
        php${PHP}-xmlwriter \
        php${PHP}-pecl-redis \
        php${PHP}-pecl-swoole \
        php${PHP}-pecl-xdebug \
    && ln -sf /usr/bin/php${PHP} /usr/bin/php \
    && mv /etc/php/php.ini /etc/php${PHP}/conf.d/99_phpctl.ini \
    && wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet \
    && mv composer.phar /usr/bin/composer \
    && wget https://psysh.org/psysh && chmod a+x psysh && mv psysh /usr/local/bin/psysh \
    && wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer && chmod a+x php-cs-fixer && mv php-cs-fixer /usr/local/bin/php-cs-fixer \
    && rm -rf /var/cache/apk/*
ENTRYPOINT [ "/usr/bin/php" ]
CMD [ "-v" ]
