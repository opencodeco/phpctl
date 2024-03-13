FROM ubuntu
RUN apt update && apt install -y bash curl docker.io git make neofetch openssl sudo
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
