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
- Git
- Docker

### Install
```shell
wget https://raw.githubusercontent.com/opencodeco/phpctl/main/installer.sh -qO- | bash
```

## Usage
Then you can use `phpctl` or `pctl` with a subcommand:
```shell
phpctl <command> [arguments]
```

For example
```shell
phpctl php -m # To show built-in modules
```
Or
```shell
phpctl sh echo 'Hello, World!' # To run arbitrary sh commands inside the container
```

## Command list

### Developing
| Command                     | Description                                                                                 |
|-----------------------------|---------------------------------------------------------------------------------------------|
| `php`                       | **Runs PHP commands** (`phpctl php -v` or `phpctl php -m`).                                 |
| `composer`                  | Runs Composer commands (`phpctl composer install` or `pctl composer validate`).             |
| `at [port] [command]`       | Runs commands within a bound port (default port is `80`).                                   |
| `server [port] [directory]` | Runs PHP's built-in web-server (default port is `80` and default directory is current `.`). |

### Useful 
| Command                      | Description                                                            |
|------------------------------|------------------------------------------------------------------------|
| `sh [commands]`              | Starts an interactive Shell session or runs `sh` commands.             |
| `repl`                       | Starts a PHP REPL session (powered by [PsySH](https://psysh.org/)).    |
| `fix [arguments]`            | Runs PHP CS Fixer on the given directory.                              |
| `new [template] [directory]` | Creates a new project from a template (`composer create-project`).     |

### Helpers
| Command                      | Description                                                  |
|------------------------------|--------------------------------------------------------------|
| `help` or `man`              | Displays a help message.                                     |
| `doctor`                     | Inspects the current `PHP_VERSION` and `PHPCTL_IMAGE`.       |
| `build`                      | Builds the current `Dockerfile` (useful for custom images).  |
| `images`                     | Shows local `phpctl` images.                                 |

## The `.phpctlrc` file
You can also add a `.phpctlrc` file at project's root directory with some overrides like:

### Environment variables
| Variable       | Description                       |
|----------------|-----------------------------------|
| `PHP_VERSION`  | Values can be `82` and `83`       |
| `PHPCTL_IMAGE` | Use to name your own custom image |

For example:
```shell
PHP_VERSION=83
```

### Docker arguments

You can also provide any additional [Docker `run` arguments](https://docs.docker.com/engine/reference/commandline/run/#options) using the `args` variable.

For example, suppose you want to bind the `9501` port from the running `phpctl` container to your host,
you can add the following to your `.phpctlrc` file:
```shell
args=(-p 9501:9501)
```

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

## Contributing

Click here to read the [contributing guidelines](CONTRIBUTING.md).
