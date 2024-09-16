ARG ALPINE=3.20
FROM alpine:${ALPINE}

ARG PHP
ENV PHP_VERSION=$PHP

ARG WITH_EXAKAT
ENV WITH_EXAKAT=$WITH_EXAKAT

ARG WITHOUT_WATCHR
ENV WITHOUT_WATCHR=$WITHOUT_WATCHR

COPY rootfs /
RUN sed -i 's/latest-stable/${ALPINE}/g' /etc/apk/repositories && \
    apk update && apk upgrade && apk add --no-cache \
        git \
        docker-cli \
        php${PHP}-cli \
        php${PHP}-ctype \
        php${PHP}-curl \
        php${PHP}-dom \
        php${PHP}-ffi \
        php${PHP}-fileinfo \
        php${PHP}-gd \
        php${PHP}-iconv \
        php${PHP}-mbstring \
        php${PHP}-mysqlnd \
        php${PHP}-openssl \
        php${PHP}-pcntl \
        php${PHP}-pdo \
        php${PHP}-pdo_mysql \
        php${PHP}-pdo_pgsql \
        php${PHP}-phar \
        php${PHP}-posix \
        php${PHP}-simplexml \
        php${PHP}-sodium \
        php${PHP}-sqlite3 \
        php${PHP}-tokenizer \
        php${PHP}-xml \
        php${PHP}-xmlreader \
        php${PHP}-xmlwriter \
        php${PHP}-zip \
        php${PHP}-pecl-decimal \
        php${PHP}-pecl-ds \
        php${PHP}-pecl-mongodb \
        php${PHP}-pecl-pcov \
        php${PHP}-pecl-rdkafka \
        php${PHP}-pecl-redis \
        php${PHP}-pecl-swoole \
        php${PHP}-pecl-xdebug \
    && ln -sf /usr/bin/php${PHP} /usr/bin/php \
    && mv /etc/php/php.ini /etc/php${PHP}/conf.d/zzphp.ini \
    && /usr/local/bin/install-tools
ARG HOST_USER
RUN apk add doas; \
    adduser ${HOST_USER}; \
    echo "${HOST_USER}" | chpasswd; \
    echo "permit ${HOST_USER} as root" > /etc/doas.d/doas.conf
ENTRYPOINT [ "/usr/bin/php" ]
CMD [ "-v" ]
