FROM ubuntu
RUN apt update && apt install -y bash docker.io git make openssl sudo wget
WORKDIR /usr/local/src
COPY Makefile .
