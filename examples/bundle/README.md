# Bundle

This is the example directory for the `bundle` command.

This command is used to bundle a project into an image and ship it as a single binanry file.

The command usage is based on `phpctl bundle [image] [alias] [entryfile]`.

But this directory uses `make` to make life easier.

So just:
```shell
make && make install
```

Then execute:
```shell
phpctl-bundle
```

You should see:
```text
Hello, World!
```
As the output.

The program is `main.php`:
```php
<?php

echo "Hello, World!\n";

```