.PHONY: default
default: build

.PHONY: build
build:
	phpctl build

.PHONY: test
test:
	@COMPOSER_AUTH= TERM= notty ./lib/bashunit ./tests/

.PHONY: install
install:
	@sudo ./scripts/symlink-bins.sh
