FROM archlinux
RUN pacman -Syu --noconfirm curl docker git make neofetch sudo
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
