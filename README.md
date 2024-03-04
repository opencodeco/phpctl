<table>
  <tr>
    <td>
      <img alt="phpctl logo" src="https://github.com/opencodeco/phpctl/assets/183722/f241cca0-aa1d-4776-b4f7-ff17c3f11955">
    </td>
    <td>
      <h1>
        phpctl
        <a href="https://github.com/opencodeco/phpctl/actions/workflows/docker.yml"><img alt="phpctl docker badge" src="https://github.com/opencodeco/phpctl/actions/workflows/docker.yml/badge.svg"></a>
        <a href="https://github.com/opencodeco/phpctl/actions/workflows/frankenphp.yml"><img alt="phpctl frankenphp badge" src="https://github.com/opencodeco/phpctl/actions/workflows/frankenphp.yml/badge.svg"></a>
      </h1>
      <p>🐳 A Docker-based development environment for PHP 🐘</p>
      <blockquote>Heavily inspired by <a href="https://github.com/opencodeco/hfctl">opencodeco/hfctl</a>.</blockquote>
    </td>
  </tr>
</table>

## Introduction

**Frictionless PHP Development!** Seamlessly run and switch between different versions of PHP, with different installed extensions, thanks to the power of containers.
Take the advantage of goodie commands like `phpctl create` to start a new project, `phpctl repl` to start a REPL, `phpctl init` to initialize a new configuration file **and a lot more**.

## Getting started

> [!TIP]
> Pro-tip: use it with [`stack`](https://github.com/opencodeco/stack) to spin up infrastructure components like MySQL, Redis, RabbitMQ etc.

### Requirements
- Bash
- Git
- Docker

### Install
You can install with default installer script for a system-wide (at `/usr/local/bin`), run:
```shell
wget -q https://phpctl.dev/phpctl-installer.sh && \
bash phpctl-installer.sh && rm phpctl-installer.sh
```

> [!TIP]
> You can also pass an argument to install at a custom location (e.g. `~/bin`), but you have to make sure that folder is in your `$PATH` variable.
> ```shell
> bash phpctl-installer.sh ~/bin
> ```

#### Homebrew
```shell
brew install opencodeco/phpctl/phpctl
```

Or add the `oppencodeco` tap with `brew tap opencodeco/phpctl` and then `brew install phpctl`

#### Update
You can re-run the installer or use the `self-update` command:
```shell
phpctl self-update
```

For those using Homebrew `brew upgrade opencodeco/phpctl/phpctl` or when run `brew update`

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
| `server [port] [directory]` | Runs PHP's built-in web-server (default port is `80` and default directory is current `.`). |
| `sh [commands]`             | Starts an interactive Shell session or runs `sh` commands.                                  |
| `repl`                      | Starts a PHP REPL session (powered by [PsySH](https://psysh.org/)).                         |
| `bundle`                    | Bundles a project into an image and ships it as a single binary file.                       |

### Tools
| Command        | Description                                                                                                                                           |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `box`          | [Box](https://github.com/box-project/box): fast, zero config application bundler with PHARs.                                                          |
| `exakat`       | [Exakat](https://www.exakat.io) is a real time customizable static analyzer engine that analyse and fix code.                                         |
| `frankenphp`   | [FrankenPHP](https://frankenphp.dev): the Modern PHP App Server, written in Go.                                                                       |
| `infection`    | [Infection](https://infection.github.io) is a Mutation Testing Framework.                                                                             |
| `pest`         | [Pest](https://pestphp.com) is a testing framework with a focus on simplicity.                                                                        |
| `php-cs-fixer` | [PHP Coding Standards Fixer (PHP CS Fixer)](https://cs.symfony.com/) fixes your code to follow standards.                                             |
| `phpcbf`       | [PHP CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) is an essential development tool that ensures your code remains clean and consistent. |
| `phpcs`        | [PHP CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) is an essential development tool that ensures your code remains clean and consistent. |
| `phpmd`        | [PHP Mess Detector](https://phpmd.org/) looks for several potential problems within your source code.                                                 |
| `phpstan`      | [PHPStan](https://phpstan.org/) finds bugs in your code without writing tests. It's open-source and free.                                             |
| `phpunit`      | [PHPUnit](https://phpunit.de) is a programmer-oriented testing framework for PHP.                                                                     |
| `pint`         | [Pint](https://github.com/laravel/pint) is an opinionated PHP code style fixer for minimalists.                                                       |
| `rector`       | [Rector](https://getrector.com) is a tool that you can run on any project to get an instant upgrade or automated refactoring.                         |
| `watchr`       | [watchr](https://github.com/flavioheleno/watchr): command-line utility to explore and validate domain names and certificates.                         |

### Scaffolders
| Command                    | Description                                                   |
|----------------------------|---------------------------------------------------------------|
| `create [framework] [dir]` | Creates a new project using the given framework (or package). |
| `init [skeleton]`          | Initializes a skeleton configuration.                         |

#### Skeletons
- `phpunit`
- `php-cs-fixer`
- `phpstan`
- `infection`
- `box`

### Helpers
| Command         | Description                                                 |
|-----------------|-------------------------------------------------------------|
| `help` or `man` | Displays a help message.                                    |
| `self-update`   | Updates `phpctl` iself.                                     |
| `doctor`        | Inspects the current `PHP_VERSION` and `PHPCTL_IMAGE`.      |
| `build`         | Builds the current `Dockerfile` (useful for custom images). |
| `images`        | Shows local `phpctl` images.                                |

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

### Docker behaviour

#### Run options

You can also provide any additional [Docker `run` arguments](https://docs.docker.com/engine/reference/commandline/run/#options) using the `args` variable.

For example, suppose you want to bind the `9501` port from the running `phpctl` container to your host,
you can add the following to your `.phpctlrc` file:
```shell
args=(-p 9501:9501)
```

#### Build options

You can also provide [build options](https://docs.docker.com/engine/reference/commandline/build/) to the build command using the `build` variable:
```shell
build=(--build-arg APP_ENV=dev --label phprocks)
```

### Podman

You can use Podman instead of Docker by setting the `PHPCTL_RUNTIME` variable to `podman` in your environment variables or at `.phpctlrc` file.
```shell
PHPCTL_RUNTIME=podman phpctl php -v
```

### Host user

By default, `phpctl` creates an user considering host user. You can change from `root` to host user through `PHPCTL_USER` variable.
```shell
PHPCTL_USER=your_user phpctl sh whoami
```

## The `phpctl.ini` file
You can also add a `phpctl.ini` file at project's root directory to set any [`php.ini` directive](https://www.php.net/manual/en/ini.list.php).
```ini
memory_limit = 1337M
```

```shell
$ phpctl php -i | grep memory_limit
memory_limit => 1337M => 1337M
```

## Modules
<details>
<summary>For the default Docker image we have the following modules installed (click to expand).</summary>
<pre>
[PHP Modules]
Core
ctype
curl
date
decimal
dom
fileinfo
filter
hash
iconv
igbinary
json
libxml
mbstring
mongodb
msgpack
mysqlnd
openssl
pcntl
pcov
pcre
PDO
pdo_mysql
pdo_odbc
pdo_pgsql
pdo_sqlite
Phar
posix
random
rdkafka
readline
redis
Reflection
session
SimpleXML
sockets
sodium
SPL
sqlite3
standard
swoole
tokenizer
xml
xmlreader
xmlwriter
zip
zlib
</pre>
</details>

You can always use your custom image with the `PHPCTL_IMAGE` variable, but feel free to ask for more essential extensions in the issues.

## Why it exists?
> [!TIP]
> After some years struggling with different PHP distributions into different operating systems, dealing with different PHP versions and sets of extensions,
> I came out with `phpctl` to use the power of containers to seamlessly run PHP :elephant: for developement environments.

## Contributing
Click here to read the [contributing guidelines](CONTRIBUTING.md).
