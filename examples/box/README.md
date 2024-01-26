# Box

To use `box` with `phpctl` you can simply `phpctl box` like:
```shell
phpctl box compile
```

You can also use `init` to initialize a configuration file:
```shell
phpctl init box
```

For this example, we already have a `Makefile` configured so just:
```shell
make
```

Then a `main.phar` will be generated:
```shell
./main.phar test
```

Head to the [Box project documentation](https://box-project.github.io/box/configuration/) to see the full and in details what you can do.

> [!NOTE]  
> This example is using [minicli](https://docs.minicli.dev/en/latest/) for demonstration purposes.
