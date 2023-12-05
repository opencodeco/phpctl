<table>
  <tr>
    <td>
      <img src="https://github.com/opencodeco/phpctl/assets/183722/f241cca0-aa1d-4776-b4f7-ff17c3f11955">
    </td>
    <td>
      <h1>phpctl <a href="https://github.com/opencodeco/phpctl/actions/workflows/ci.yml"><img src="https://github.com/opencodeco/phpctl/actions/workflows/ci.yml/badge.svg"></a></h1>
      <p>🐳 A Docker-based development environment for PHP 🐘</p>
      <blockquote>Heavily inspired by <a href="https://github.com/opencodeco/hfctl">opencodeco/hfctl</a>.</blockquote>
    </td>
  </tr>
</table>

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

## Usage

Then you can use `phpctl` or `pctl` with a subcommand:
```shell
phpctl <command> [arguments]
```

### Commands

| Command                     | Description                                                                                 |
|-----------------------------|---------------------------------------------------------------------------------------------|
| `help` or `man`             | Shows a help message.                                                                       |
| `doctor`                    | Inspects the current `PHP_VERSION` and `PHPCTL_IMAGE`.                                      |
| `install`                   | Installs `phpctl` (and `pctl`) globally in your system.                                     |
| `build`                     | Builds the current `Dockerfile` (useful for custom images).                                 |
| `images`                    | Shows local `phpctl` images.                                                                |
| `php`                       | **Runs PHP commands** (`phpctl php -v` or `pctl php -m`).                                   |
| `composer`                  | Runs Composer commands (`phpctl composer install` or `pctl composer validate`).             |
| `server [port] [directory]` | Runs PHP's built-in web-server (default port is `80` and default directory is current `.`). |
| `sh [commands]`             | Starts an interactive Shell session or runs `sh` commands.                                  |
| `at [port] [command]`       | Run commands within a bound port (default port is `80`).                                    |
| `repl`                      | Starts a PHP REPL session (powered by [PsySH](https://psysh.org/)).                         |
| `fix [directory]`           | Runs PHP CS Fixer on the given directory.                                                   |

### The `.phpctl` file

You can also add a `.phpctl` file with some overrides like:

| Variable | Description |
| --- | --- |
| `PHP_VERSION` | Values can be `82` and `83` |
| `PHPCTL_IMAGE` | Use to name your own custom image |

## Modules
<details>
<summary>For the default Docker image we have the following modules installed (click to expand).</summary>
<pre>
[PHP Modules]
Core
curl
date
dom
filter
hash
iconv
igbinary
json
libxml
mbstring
msgpack
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
Phar
posix
random
readline
redis
Reflection
session
sockets
SPL
standard
swoole
tokenizer
xdebug
xml
xmlwriter
zend_test
zlib

[Zend Modules]
Xdebug
</pre>
</details>

You can always use your custom image with the `PHPCTL_IMAGE` variable, but feel free to ask for more essential extensions in the issues.
