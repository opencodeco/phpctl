.PHONY: default
default: build

.PHONY: build
build:
	phpctl build

.PHONY: test
test:
	@PHPCTL_TTY=--label=no-tty COMPOSER_AUTH= ./lib/bashunit ./tests/

.PHONY: install
install:
	@sudo ln -sf $(shell pwd)/bin/composer      /usr/local/bin/composer
	@sudo ln -sf $(shell pwd)/bin/php           /usr/local/bin/php
	@sudo ln -sf $(shell pwd)/bin/php-cs-fixer  /usr/local/bin/php-cs-fixer
	@sudo ln -sf $(shell pwd)/bin/phpctl        /usr/local/bin/pctl
	@sudo ln -sf $(shell pwd)/bin/phpctl        /usr/local/bin/phpctl
	@sudo ln -sf $(shell pwd)/bin/phpstan       /usr/local/bin/phpstan
	@sudo ln -sf $(shell pwd)/bin/phpunit       /usr/local/bin/phpunit
	@sudo ln -sf $(shell pwd)/bin/infection     /usr/local/bin/infection
