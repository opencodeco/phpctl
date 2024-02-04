FROM ubuntu
RUN apt update && apt install -y bash docker git make openssl sudo
WORKDIR /usr/local/src
COPY Makefile .
