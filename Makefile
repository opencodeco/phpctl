.PHONY: default
default: build

.PHONY: build
build:
	@parallel --line-buffer PHP_VERSION={} phpctl build ::: 81 82 83

.PHONY: test
test:
	@parallel --line-buffer PHP_VERSION={} COMPOSER_AUTH= TERM= notty ./lib/bashunit ./tests/ ::: 81 82 83

.PHONY: install
install:
	@sudo ./scripts/symlink-bins.sh
