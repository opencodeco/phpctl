.PHONY: default
default: build

.PHONY: build
build:
	phpctl build

.PHONY: test
test:
	@PHPCTL_TTY=--label=no-tty COMPOSER_AUTH= TERM= ./lib/bashunit ./tests/

.PHONY: install
install:
	@sudo ./scripts/symlink-bins.sh
