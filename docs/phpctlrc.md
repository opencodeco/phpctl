---
nav_order: 3
---

# The `.phpctlrc` file
You can also add a `.phpctlrc` file at project's root directory with some overrides like:

## Environment variables

| Variable       | Description                       |
|----------------|-----------------------------------|
| `PHP_VERSION`  | Values can be `82` and `83`       |
| `PHPCTL_IMAGE` | Use to name your own custom image |

For example:
```shell
PHP_VERSION=83
```

## Docker behaviour

### Run options

You can also provide any additional [Docker `run` arguments](https://docs.docker.com/engine/reference/commandline/run/#options) using the `args` variable.

For example, suppose you want to bind the `9501` port from the running `phpctl` container to your host,
you can add the following to your `.phpctlrc` file:
```shell
args=(-p 9501:9501)
```

### Build options

You can also provide [build options](https://docs.docker.com/engine/reference/commandline/build/) to the build command using the `build` variable:
```shell
build=(--build-arg APP_ENV=dev --label phprocks)
```

## Podman

You can use Podman instead of Docker by setting the `PHPCTL_RUNTIME` variable to `podman` in your environment variables or at `.phpctlrc` file.
```shell
PHPCTL_RUNTIME=podman phpctl php -v
```

## Host user

By default, `phpctl` creates an user considering host user. You can change from `root` to host user through `PHPCTL_USER` variable.
```shell
PHPCTL_USER=your_user phpctl sh whoami
```
