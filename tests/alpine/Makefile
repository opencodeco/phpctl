.PHONY: default
default: build run

.PHONY: build
build:
	docker build -t phpctl-alpine-test .

.PHONY: run
run:
	docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock phpctl-alpine-test sh

.PHONY: install
install:
	sh <(wget -qO- https://phpctl.dev/install.sh)

.PHONY: test
test:
	ls -lha /usr/local/bin
	phpctl doctor
	php --version
	composer --version
