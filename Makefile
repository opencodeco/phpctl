.PHONY: test
test:
	@PHPCTL_TTY=--label=no-tty COMPOSER_AUTH= ./lib/bashunit ./tests/

.PHONY: install
install:
	@INSTALL_DIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
	@sudo ln -sf ${INSTALL_DIR}/phpctl /usr/local/bin/phpctl
	@sudo ln -sf ${INSTALL_DIR}/phpctl /usr/local/bin/pctls
