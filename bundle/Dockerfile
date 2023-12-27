ARG FROM=opencodeco/phpctl:php82
FROM $FROM
ARG ENTRYPOINT=php
ENV ENTRYPOINT=$ENTRYPOINT
ARG COMMAND=index.php
ENV COMMAND=$COMMAND
COPY . /usr/src
ENTRYPOINT [ "/usr/src/docker-entrypoint.sh" ]
