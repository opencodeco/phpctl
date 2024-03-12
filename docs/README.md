# Frictionless PHP Development

[Get started now](#getting-started){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View it on GitHub](https://github.com/opencodeco/phpctl){: .btn .fs-5 .mb-4 .mb-md-0 }

Seamlessly run and switch between different versions of PHP, with different installed extensions, thanks to the power of containers.

Take the advantage of goodies commands like `phpctl create` to start a new project, `phpctl repl` to start a REPL, `phpctl init` to initialize a new configuration file **and a lot more**.

## Getting started

### Installation

```shell
wget -q https://phpctl.dev/phpctl-installer.sh && \
bash phpctl-installer.sh && rm phpctl-installer.sh
```

**That is it!** Now you have `phpctl` available in your system.

### Usage

Simple as calling any other command in your terminal:

```shell
phpctl <command> [options]
```

You will also have aliases for the most common commands available without the `phpctl` prefix, like:
- `php`
- `composer`
- `phpunit`
- `php-cs-fixer`
- etc

So you can use them as you would normally do:

```shell
php -v # same as `phpctl php -v`
```

Or

```shell
composer --version # same as `phpctl composer --version`
```

**Have fun!** Feel free to open any issues or PRs.