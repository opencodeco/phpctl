FROM alpine
RUN apk add bash curl docker git make neofetch openssl sudo
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
