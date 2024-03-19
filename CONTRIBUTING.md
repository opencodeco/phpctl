# Contributing

Feel free to contribute to this project by submitting a pull request to the `main` branch.

## Developing

You can use `make` to simplify the development process.

> [!NOTE]
> Make sure you have [GNU/Parallel](https://www.gnu.org/software/parallel/) installed to speed up processes for each PHP version.

### Building
You can build the default image using `make build` or just `make`, the `build` target is the default:
```shell
make
```

### Testing
To run the tests, you can use the `test` target:
```shell
make test
```

> [!TIP]
> So you will problably be running `make && make test` for most of the time.

### Installing
You can use the `install` target to make links of the binaries (`bin/`) to your `/usr/local/bin` directory:
```shell
make install
```
