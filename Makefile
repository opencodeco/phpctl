.PHONY: test
test:
	@PHPCTL_TTY=--label=no-tty COMPOSER_AUTH= ./lib/bashunit ./tests/

.PHONY: install
install:
	@sudo ln -sf $(shell pwd)/composer /usr/local/bin/composer
	@sudo ln -sf $(shell pwd)/php      /usr/local/bin/php
	@sudo ln -sf $(shell pwd)/phpctl   /usr/local/bin/pctl
	@sudo ln -sf $(shell pwd)/phpctl   /usr/local/bin/phpctl
