.PHONY: test
test:
	@PHPCTL_TTY=--label=no-tty COMPOSER_AUTH= ./lib/bashunit ./tests/

.PHONY: install
install:
	@sudo ln -sf $(shell pwd)/phpctl /usr/local/bin/phpctl
	@sudo ln -sf $(shell pwd)/phpctl /usr/local/bin/pctl
