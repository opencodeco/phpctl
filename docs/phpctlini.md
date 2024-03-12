## The `phpctl.ini` file
You can also add a `phpctl.ini` file at project's root directory to set any [`php.ini` directive](https://www.php.net/manual/en/ini.list.php).
```ini
memory_limit = 1337M
```

```shell
$ phpctl php -i | grep memory_limit
memory_limit => 1337M => 1337M
```
