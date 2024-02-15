FROM archlinux
RUN pacman -Syu --noconfirm docker make wget sudo git
WORKDIR /usr/local/src
COPY Makefile .
