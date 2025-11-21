--- 
title: Frictionless PHP Development
nav_order: 1
permalink: /
---

# Frictionless PHP Development

[Get started now](#getting-started){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View it on GitHub](https://github.com/opencodeco/phpctl){: .btn .fs-5 .mb-4 .mb-md-0 }

Seamlessly run and switch between different versions of PHP, with different installed extensions, thanks to the power of containers.

Take the advantage of goodies commands like `phpctl create` to start a new project, `phpctl repl` to start a REPL, `phpctl init` to initialize a new configuration file **and a lot more**.

## Getting started

### Installation

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/opencodeco/phpctl/refs/heads/main/docs/install.sh)"
```

**That is it!** Now you have `phpctl` available in your system.

#### Custom installation
You can also pass an argument to install at a custom location (e.g. `~/bin`), but you have to make sure that folder is in your `$PATH` variable.
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/opencodeco/phpctl/refs/heads/main/docs/install.sh)" ~/bin
```

#### Homebrew
```shell
brew install opencodeco/phpctl/phpctl
```

Or add the `oppencodeco` tap with `brew tap opencodeco/phpctl` and then `brew install phpctl`.

### Update
You can re-run the installer or use the `self-update` command:
```shell
phpctl self-update
```

For those using Homebrew `brew upgrade opencodeco/phpctl/phpctl` or when run `brew update`.

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