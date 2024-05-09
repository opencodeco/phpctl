#!/usr/bin/env bash
export PHP_VERSION_STR="${PHP_VERSION:0:1}.${PHP_VERSION:1}"
devcontainer build --workspace-folder src-devc --push true --image-name "opencodeco/phpctl:php$PHP_VERSION-devcontainer"
