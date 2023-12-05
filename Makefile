.PHONY: test
test:
	PHPCTL_TTY=--label=no-tty COMPOSER_AUTH= ./lib/bashunit ./tests/

.PHONY: install
install:
	./phpctl install
