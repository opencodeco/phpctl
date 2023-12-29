<table>
  <tr>
    <td>
      <img alt="phpctl logo" src="https://github.com/opencodeco/phpctl/assets/183722/f241cca0-aa1d-4776-b4f7-ff17c3f11955">
    </td>
    <td>
      <h1>phpctl <a href="https://github.com/opencodeco/phpctl/actions/workflows/ci.yml"><img alt="phpctl ci badge" src="https://github.com/opencodeco/phpctl/actions/workflows/ci.yml/badge.svg"></a></h1>
      <p>🐳 A Docker-based development environment for PHP 🐘</p>
      <blockquote>Heavily inspired by <a href="https://github.com/opencodeco/hfctl">opencodeco/hfctl</a>.</blockquote>
    </td>
  </tr>
</table>

## Introduction

**Frictionless PHP Development!** Seamlessly run and switch between different versions of PHP, with different installed extensions, thanks to the power of containers.
Take the advantage of goodie commands like `phpctl create` to start a new project, `phpctl repl` to start a REPL, `phpclt init` to initialize a new configuration file **and a lot more**.

## Getting started

> [!TIP]  
> Pro-tip: use it with [`stack`](https://github.com/opencodeco/stack) to spin up infrastructure components like MySQL, Redis, RabbitMQ etc.

### Requirements
- Git
- Docker

### Install
```shell
sh <(wget -qO- https://raw.githubusercontent.com/opencodeco/phpctl/main/installer.sh)
```

#### Update
You can re-run the installer or use the `self-update` command:
```shell
phpctl self-update
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
| `server [port] [directory]` | Runs PHP's built-in web-server (default port is `80` and default directory is current `.`). |

### Useful 
| Command         | Description                                                           |
|-----------------|-----------------------------------------------------------------------|
| `phpunit`       | Runs [PHPUnit](https://phpunit.de/).                                  |
| `sh [commands]` | Starts an interactive Shell session or runs `sh` commands.            |
| `repl`          | Starts a PHP REPL session (powered by [PsySH](https://psysh.org/)).   |
| `php-cs-fixer`  | Runs [PHP-CS-Fixer](https://cs.symfony.com/).                         |
| `phpstan`       | Runs [PHPStan](https://phpstan.org/).                                 |
| `infection`     | Runs [Infection](https://infection.github.io/).                       |
| `box`           | Runs [Box](https://github.com/box-project/box).                       |
| `bundle`        | Bundles a project into an image and ships it as a single binary file. |

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

## Modules
<details>
<summary>For the default Docker image we have the following modules installed (click to expand).</summary>
<pre>
[PHP Modules]
Core
ctype
curl
date
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
SPL
standard
swoole
tokenizer
xml
xmlreader
xmlwriter
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
