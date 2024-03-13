.PHONY: build
build:
	@parallel --line-buffer ./build {} ::: alpine archlinux ubuntu

.PHONY: test
test:
	@parallel --line-buffer ./test {} ::: alpine archlinux ubuntu
