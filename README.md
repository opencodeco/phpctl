<table>
  <tr>
    <td>
      <img alt="phpctl logo" src="https://github.com/opencodeco/phpctl/assets/183722/f241cca0-aa1d-4776-b4f7-ff17c3f11955">
    </td>
    <td>
      <h1>
        phpctl
        <a href="https://github.com/opencodeco/phpctl/actions/workflows/docker.yml"><img alt="phpctl docker badge" src="https://github.com/opencodeco/phpctl/actions/workflows/docker.yml/badge.svg"></a>
        <a href="https://github.com/opencodeco/phpctl/actions/workflows/devcontainer.yml"><img alt="phpctl docker badge" src="https://github.com/opencodeco/phpctl/actions/workflows/devcontainer.yml/badge.svg"></a>
        <a href="https://github.com/opencodeco/phpctl/actions/workflows/frankenphp.yml"><img alt="phpctl frankenphp badge" src="https://github.com/opencodeco/phpctl/actions/workflows/frankenphp.yml/badge.svg"></a>
      </h1>
      <p>🐳 A Docker-based development environment for PHP 🐘</p>
      <blockquote>Heavily inspired by <a href="https://github.com/opencodeco/hfctl">opencodeco/hfctl</a>.</blockquote>
      <p><a href="https://codespaces.new/opencodeco/phpctl?machine=standardLinux32gb"><img alt="Open in GitHub Codespaces" src="https://github.com/codespaces/badge.svg"></a></p>
    </td>
  </tr>
</table>

## Frictionless PHP Development

Seamlessly run and switch between different versions of PHP, with different installed extensions, thanks to the power of containers.
Take the advantage of goodie commands like `phpctl create` to start a new project, `phpctl repl` to start a REPL, `phpctl init` to initialize a new configuration file **and a lot more**.

### Just install
```shell
/bin/bash -c "$(curl -fsSL https://phpctl.dev/install.sh)"
```
### And that is it!
Try it out:
```shell
phpctl doctor
php --version
composer --version
```

## Getting started

- [Installation guide](https://phpctl.dev/#installation)
- [How to use](https://phpctl.dev/#usage)
- [Available commands](https://phpctl.dev/commands)
- [The `.phpctlrc` file](https://phpctl.dev/phpctlrc)
- [The `phpctl.ini` file](https://phpctl.dev/phpctlini)
- [Available extensions](https://phpctl.dev/extensions)
- [Why it exists?](https://phpctl.dev/why)

## Contributing
Click here to read the [contributing guidelines](CONTRIBUTING.md).
