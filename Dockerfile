ARG ALPINE=3.19
FROM alpine:${ALPINE}
ARG PHP

ARG WITH_EXAKAT
ENV WITH_EXAKAT=$WITH_EXAKAT

ARG WITHOUT_WATCHR
ENV WITHOUT_WATCHR=$WITHOUT_WATCHR

COPY rootfs /
RUN apk add --update --no-cache \
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
        php${PHP}-sodium \
        php${PHP}-sqlite3 \
        php${PHP}-tokenizer \
        php${PHP}-xml \
        php${PHP}-xmlreader \
        php${PHP}-xmlwriter \
        php${PHP}-zip \
        php${PHP}-pecl-mongodb \
        php${PHP}-pecl-pcov \
        php${PHP}-pecl-rdkafka \
        php${PHP}-pecl-redis \
        php${PHP}-pecl-swoole \
        php${PHP}-pecl-xdebug \
    && ln -sf /usr/bin/php${PHP} /usr/bin/php \
    && mv /etc/php/php.ini /etc/php${PHP}/conf.d/zzphp.ini \
    && /usr/local/bin/install-tools

#SQL Server (Only PHP82)
ENV PATCH_SHARE=/usr/local/share
RUN if [ "$PHP" = "82" ]; then \
    apk add --update --no-cache php${PHP}-pear php${PHP}-dev build-base && \
    wget --no-check-certificate http://pecl.php.net/get/pdo_sqlsrv -O ${PATCH_SHARE}/pdo_sqlsrv.tgz && \
    wget --no-check-certificate http://pecl.php.net/get/sqlsrv -O ${PATCH_SHARE}/sqlsrv.tgz && \
    wget https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/msodbcsql18_18.3.2.1-1_amd64.apk && \
    wget https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/mssql-tools18_18.3.1.1-1_amd64.apk && \
    apk add --allow-untrusted msodbcsql18_18.3.2.1-1_amd64.apk && \
    apk add --allow-untrusted mssql-tools18_18.3.1.1-1_amd64.apk && \
    apk del $PHPIZE_DEPS &&  rm msodbcsql18_18.3.2.1-1_amd64.apk && rm mssql-tools18_18.3.1.1-1_amd64.apk && \
    apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS unixodbc-dev && \
    pecl install -O ${PATCH_SHARE}/pdo_sqlsrv.tgz && echo "extension=pdo_sqlsrv.so" > /etc/php${PHP}/conf.d/pdo_sqlsrv.ini && \
    pecl install -O ${PATCH_SHARE}/sqlsrv.tgz && echo "extension=sqlsrv.so" > /etc/php${PHP}/conf.d/sqlsrv.ini && \
    rm ${PATCH_SHARE}/pdo_sqlsrv.tgz && rm ${PATCH_SHARE}/sqlsrv.tgz \
    ;fi

ARG HOST_USER
RUN apk add doas; \
    adduser ${HOST_USER}; \
    echo "${HOST_USER}" | chpasswd; \
    echo "permit ${HOST_USER} as root" > /etc/doas.d/doas.conf
ENTRYPOINT [ "/usr/bin/php" ]
CMD [ "-v" ]
