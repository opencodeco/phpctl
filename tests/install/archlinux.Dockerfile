FROM archlinux
RUN pacman -Syu --noconfirm docker
WORKDIR /usr/local/src
COPY Makefile .
