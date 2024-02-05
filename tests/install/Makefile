.PHONY: default
default: build run

.PHONY: build
build:
	docker build -t phpctl-${OS}-test -f ${OS}.Dockerfile .

.PHONY: run
run:
	docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock phpctl-${OS}-test bash

.PHONY: install
install:
	wget -q https://phpctl.dev/phpctl-installer.sh
	bash phpctl-installer.sh
	rm phpctl-installer.sh

.PHONY: test
test:
	ls -lha /usr/local/bin
	phpctl doctor
	php --version
	composer --version
