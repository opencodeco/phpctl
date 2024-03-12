ARG ALPINE=3.19
FROM alpine:${ALPINE}

ARG PHP
ENV PHP_VERSION=$PHP

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

#SQLServer and Oracle (ext)
ENV PECL_URL=http://pecl.php.net/get \
    ORACLE_BASE=/usr/lib/instantclient \
    LD_LIBRARY_PATH=/usr/lib/instantclient \
    TNS_ADMIN=/usr/lib/instantclient \
    ORACLE_HOME=/usr/lib/instantclient \
    NLS_LANG=AMERICAN_AMERICA.AL32UTF8

RUN if [ "$PHP" != "81" ]; then \
    apk add --update --no-cache build-base gcc php${PHP}-dev musl-dev unixodbc-dev libaio libnsl libc6-compat \
    && wget --no-check-certificate https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/msodbcsql18_18.3.2.1-1_amd64.apk -O /msodbcsql18_18.3.2.1-1_amd64.apk \
    && wget --no-check-certificate https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/mssql-tools18_18.3.1.1-1_amd64.apk -O /mssql-tools18_18.3.1.1-1_amd64.apk \
    && apk add --allow-untrusted /msodbcsql18_18.3.2.1-1_amd64.apk \
    && apk add --allow-untrusted /mssql-tools18_18.3.1.1-1_amd64.apk \
    && rm -f /msodbcsql18_18.3.2.1-1_amd64.apk /mssql-tools18_18.3.1.1-1_amd64.apk \
    && wget --no-check-certificate ${PECL_URL}/pdo_sqlsrv -O /tmp/pdo_sqlsrv.tgz \
    && wget --no-check-certificate ${PECL_URL}/sqlsrv -O /tmp/sqlsrv.tgz \
    && tar -xzf /tmp/pdo_sqlsrv.tgz -C /tmp \
    && tar -xzf /tmp/sqlsrv.tgz -C /tmp \
    && cd /tmp/pdo_sqlsrv-* \
    && /usr/bin/phpize${PHP} \
    && ./configure --with-php-config=/usr/bin/php-config${PHP} \
    && make \
    && make install \
    && cd /tmp/sqlsrv-* \
    && /usr/bin/phpize${PHP} \
    && ./configure --with-php-config=/usr/bin/php-config${PHP} \
    && make \
    && make install \
    && echo "extension=pdo_sqlsrv.so" > /etc/php${PHP}/conf.d/pdo_sqlsrv.ini \
    && echo "extension=sqlsrv.so" > /etc/php${PHP}/conf.d/sqlsrv.ini \
    && wget --no-check-certificate https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip -O instantclient-basiclite.zip \
    && wget --no-check-certificate https://download.oracle.com/otn_software/linux/instantclient/instantclient-sdk-linuxx64.zip -O instantclient-sdk.zip \
    && unzip instantclient-basiclite.zip \
    && unzip instantclient-sdk.zip \
    && mv instantclient*/ /usr/lib/instantclient \
    && rm instantclient-basiclite.zip instantclient-sdk.zip \
    && ln -s /usr/lib/instantclient/libclntsh.so.19.1 /usr/lib/libclntsh.so \
    && ln -s /usr/lib/instantclient/libocci.so.19.1 /usr/lib/libocci.so \
    && ln -s /usr/lib/instantclient/libociicus.so /usr/lib/libociicus.so \
    && ln -s /usr/lib/instantclient/libnnz19.so /usr/lib/libnnz19.so \
    && ln -s /usr/lib/libnsl.so.2 /usr/lib/libnsl.so.1 \
    && ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 \
    && ln -s /lib64/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 \
    && wget --no-check-certificate ${PECL_URL}/oci8 -O /tmp/oci8.tgz \
    && tar -xzf /tmp/oci8.tgz -C /tmp \
    && cd /tmp/oci8* \
    && /usr/bin/phpize${PHP} \
    && ./configure --with-php-config=/usr/bin/php-config${PHP} --with-oci8=instantclient,/usr/lib/instantclient \
    && make \
    && make install \
    && echo "extension=oci8.so" > /etc/php${PHP}/conf.d/oci8.ini \
    && if [ "$PHP" = "83" ]; then \
    wget --no-check-certificate https://github.com/php/pecl-database-pdo_oci/archive/refs/heads/master.tar.gz -O /tmp/pdo_oci.tar.gz \
    && tar -xzf /tmp/pdo_oci.tar.gz -C /tmp \
    && cd /tmp/pecl-database-pdo_oci* \
    && /usr/bin/phpize${PHP} \
    && ./configure --with-php-config=/usr/bin/php-config${PHP} --with-pdo-oci=instantclient,/usr/lib/instantclient \
    && make \
    && make install \
    && echo "extension=pdo_oci.so" > /etc/php${PHP}/conf.d/pdo_oci.ini \
    ;fi \
    && apk del build-base gcc musl-dev unixodbc-dev php${PHP}-dev \
    && rm -rf /tmp/* /var/cache/apk/* \
    ;fi
    
ARG HOST_USER
RUN apk add doas; \
    adduser ${HOST_USER}; \
    echo "${HOST_USER}" | chpasswd; \
    echo "permit ${HOST_USER} as root" > /etc/doas.d/doas.conf
ENTRYPOINT [ "/usr/bin/php" ]
CMD [ "-v" ]
