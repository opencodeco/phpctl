.PHONY: default
default: build

.PHONY: build
build:
	@PHP_VERSION=81 phpctl build
	@PHP_VERSION=82 phpctl build
	@PHP_VERSION=83 phpctl build

.PHONY: test
test:
	@PHP_VERSION=81 COMPOSER_AUTH= TERM= notty ./lib/bashunit ./tests/
	@PHP_VERSION=82 COMPOSER_AUTH= TERM= notty ./lib/bashunit ./tests/
	@PHP_VERSION=83 COMPOSER_AUTH= TERM= notty ./lib/bashunit ./tests/

.PHONY: install
install:
	@sudo ./scripts/symlink-bins.sh
