# phpctl [![CI](https://github.com/opencodeco/phpctl/actions/workflows/ci.yml/badge.svg)](https://github.com/opencodeco/phpctl/actions/workflows/ci.yml)

🐳 A Docker-based development environment for PHP 🐘

> Heavily inspired by [opencodeco/hfctl](https://github.com/opencodeco/hfctl).

## Getting started

### Requirements
- Docker

### Install
Clone this repository and run `./phpctl install`:
```shell
https://github.com/opencodeco/phpctl.git ~/.phpctl
cd ~/.phpctl
./phpctl install
```

### Usage

Then you can use `phpctl` or `pctl` with a subcommand:
```shell
phpctl <command> [arguments]
```

#### Commands

| Command | Description |
| --- | --- |
| `help` or `man` | Shows a help message. |
| `doctor` | Inspects the current `PHP_VERSION` and `PHPCTL_IMAGE`. |
| `install` | Installs `phpctl` (and `pctl`) globally in your system. |
| `build` | Builds the current `Dockerfile` (useful for custom images). |
| `images` | Shows local `phpctl` images. |
| `php` | **Runs PHP commands** (`phpctl php -v` or `pctl php -m`). |
| `composer` | Runs Composer commands (`phpctl composer install` or `pctl composer validate`). |
| `server [port] [directory]` | Runs PHP's built-in web-server (default port is `80` and default directory is current `.`). |
| `sh [commands]` | Starts an interactive Shell session or runs `sh` commands. |
| `at [port] [command]` | Run commands within a bound port (default port is `80`). |
#### The `.phpctl` file

You can also add a `.phpctl` file with some overrides like:

| Variable | Description |
| --- | --- |
| `PHP_VERSION` | Values can be `82` and `83` |
| `PHPCTL_IMAGE` | Use to name your own custom image |
