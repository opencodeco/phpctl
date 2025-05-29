.PHONY: default
default: build

.PHONY: build
build:
	@parallel --line-buffer PHP_VERSION={} ./bin/phpctl build ::: 81 82 83 84

.PHONY: test
test:
	@parallel --line-buffer PHP_VERSION={} COMPOSER_AUTH= TERM= ./bin/notty ./lib/bashunit ./tests/ ::: 81 82 83 84
	@[ -f phpctl.ini ] && rm phpctl.ini

.PHONY: install
install:
	@sudo ./scripts/symlink-bins.sh

.PHONY: devcontainers
devcontainers:
	@parallel --line-buffer PHP_VERSION={} ./src-devc/build.sh ::: 81 82 83 84
