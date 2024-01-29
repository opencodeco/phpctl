# Xdebug

This is an example on how you can enable and configure Xdebug to work with `phpctl` at your PHP application.

## How-to

Xdebug is already shipped within `phpctl`, you just need to enable it.

You can do so by using a `phpctl.ini` file where `phpctl` will be running.

If you run `phpctl php -v` at this directory, you will see that Xdebug is installed.

```shell
phpctl php -v
```

```shell
PHP 8.2.15 (cli) (built: Jan 18 2024 16:40:05) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.2.15, Copyright (c) Zend Technologies
    with Xdebug v3.3.1, Copyright (c) 2002-2023, by Derick Rethans
```

This is because of the `phpctl.ini` file at this directory with the following contents:

```ini
zend_extension=xdebug

[xdebug]
xdebug.mode = develop,debug
xdebug.log = /tmp/xdebug.log
xdebug.start_with_request = Yes
```

> [!TIP]
> You can use `phpctl.ini` file to change any another PHP INI directive, not just Xdebug.
