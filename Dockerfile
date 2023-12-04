ARG ALPINE=3.18
FROM alpine:${ALPINE}
ARG PHP=83
COPY rootfs /
RUN apk add --no-cache \
        php${PHP} \
        php${PHP}-iconv \
        php${PHP}-mbstring \
        php${PHP}-phar \
        php${PHP}-openssl \
        php${PHP}-pecl-swoole \
    && ln -sf /usr/bin/php${PHP} /usr/bin/php \
    && mv /etc/php/php.ini /etc/php${PHP}/conf.d/99_phpctl.ini \
    && wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet \
    && mv composer.phar /usr/bin/composer \
    && rm -rf /var/cache/apk/*
ENTRYPOINT [ "/usr/bin/php" ]
CMD [ "-v" ]
