---
nav_order: 2
---

# Available commands

## Developing
| Command                     | Description                                                                                 |
|-----------------------------|---------------------------------------------------------------------------------------------|
| `php`                       | **Runs PHP commands** (`phpctl php -v` or `phpctl php -m`).                                 |
| `composer`                  | Runs Composer commands (`phpctl composer install` or `pctl composer validate`).             |
| `server [port] [directory]` | Runs PHP's built-in web-server (default port is `80` and default directory is current `.`). |
| `sh [commands]`             | Starts an interactive Shell session or runs `sh` commands.                                  |
| `repl`                      | Starts a PHP REPL session (powered by [PsySH](https://psysh.org/)).                         |
| `bundle`                    | Bundles a project into an image and ships it as a single binary file.                       |

## Tools
| Command                    | Description                                                                                                                                                                                       |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `box`                      | [Box](https://github.com/box-project/box): fast, zero config application bundler with PHARs.                                                                                                      |
| `co-phpunit`               | [co-phpunit](https://github.com/hyperf/testing) is a Coroutine-aware PHPUnit for testing Hyperf projects.                                                                                         |
| `composer-require-checker` | [ComposerRequireChecker](https://github.com/maglnet/ComposerRequireChecker): A CLI tool to analyze composer dependencies and verify that no unknown symbols are used in the sources of a package. |
| `couscous`                 | [Couscous](https://github.com/CouscousPHP/Couscous): Couscous generates a GitHub pages website from your markdown documentation.                                                                  |
| `deptrac`                  | [Deptrac](https://github.com/qossmic/deptrac): Deptrac is a static code analysis tool for PHP that helps you communicate, visualize and enforce architectural decisions in your projects.         |
| `exakat`                   | [Exakat](https://www.exakat.io) is a real time customizable static analyzer engine that analyse and fix code.                                                                                     |
| `frankenphp`               | [FrankenPHP](https://frankenphp.dev): the Modern PHP App Server, written in Go.                                                                                                                   |
| `infection`                | [Infection](https://infection.github.io) is a Mutation Testing Framework.                                                                                                                         |
| `pest`                     | [Pest](https://pestphp.com) is a testing framework with a focus on simplicity.                                                                                                                    |
| `php-cs-fixer`             | [PHP Coding Standards Fixer (PHP CS Fixer)](https://cs.symfony.com/) fixes your code to follow standards.                                                                                         |
| `phpcbf`                   | [PHP CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) is an essential development tool that ensures your code remains clean and consistent.                                             |
| `phpcs`                    | [PHP CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) is an essential development tool that ensures your code remains clean and consistent.                                             |
| `phpmd`                    | [PHP Mess Detector](https://phpmd.org/) looks for several potential problems within your source code.                                                                                             |
| `phpstan`                  | [PHPStan](https://phpstan.org/) finds bugs in your code without writing tests. It's open-source and free.                                                                                         |
| `phpunit`                  | [PHPUnit](https://phpunit.de) is a programmer-oriented testing framework for PHP.                                                                                                                 |
| `pint`                     | [Pint](https://github.com/laravel/pint) is an opinionated PHP code style fixer for minimalists.                                                                                                   |
| `rector`                   | [Rector](https://getrector.com) is a tool that you can run on any project to get an instant upgrade or automated refactoring.                                                                     |
| `watchr`                   | [watchr](https://github.com/flavioheleno/watchr): command-line utility to explore and validate domain names and certificates.                                                                     |

## Scaffolders
| Command                    | Description                                                   |
|----------------------------|---------------------------------------------------------------|
| `create [framework] [dir]` | Creates a new project using the given framework (or package). |
| `init [skeleton]`          | Initializes a skeleton configuration.                         |

### Skeletons
- `phpunit`
- `php-cs-fixer`
- `phpstan`
- `infection`
- `box`

## Helpers
| Command         | Description                                                 |
|-----------------|-------------------------------------------------------------|
| `help` or `man` | Displays a help message.                                    |
| `self-update`   | Updates `phpctl` iself.                                     |
| `doctor`        | Inspects the current `PHP_VERSION` and `PHPCTL_IMAGE`.      |
| `build`         | Builds the current `Dockerfile` (useful for custom images). |
| `images`        | Shows local `phpctl` images.                                |
