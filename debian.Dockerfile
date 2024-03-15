FROM debian

ARG PHP
ENV PHP_VERSION=$PHP

ARG WITH_EXAKAT
ENV WITH_EXAKAT=$WITH_EXAKAT

ARG WITHOUT_WATCHR
ENV WITHOUT_WATCHR=$WITHOUT_WATCHR

COPY rootfs /

RUN apt update && apt install -y \
    wget php-cli \
    && /usr/local/bin/install-tools

ENTRYPOINT [ "/usr/bin/php" ]
CMD [ "-v" ]
