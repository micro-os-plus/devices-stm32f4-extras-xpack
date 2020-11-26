[![license](https://img.shields.io/github/license/micro-os-plus/devices-stm32f4-xpack)](https://github.com/micro-os-plus/devices-stm32f4-xpack/blob/xpack/LICENSE)

# A source xPack with complementary STM32F4 files

This project includes files not available in the official STM32CubeMX packages,
like the `vectors_*.c`, with the interrupt vectors.

This README is intended to developers who plan to include this package
in their own projects.

For maintainer infos, please see the [README-MAINTAINER](README-MAINTAINER.md) file.

## Easy install

This package is available as
[`@micro-os-plus/devices-stm32f4`](https://www.npmjs.com/package/@micro-os-plus/devices-stm32f4)
from the `npmjs.com` registry; [xpm](https://xpack.github.io/xpm/)
available, installing the latest version of the package is quite easy:

```console
$ xpm install @micro-os-plus/devices-stm32f4@latest
```

This package is also available from
[GitHub](https://github.com/micro-os-plus/devices-stm32f4-xpack):

```console
$ git clone https://github.com/micro-os-plus/devices-stm32f4-xpack.git devices-stm32f4-xpack.git
```

## Branches

Apart from the unused `master` branch, there are two active branches:

- `xpack`, with the latest stable version
- `develop`, with the current development version.

All development is done in the `develop` branch, and contributions via
Pull Requests should be directed to this branch.

When new releases are published, the `develop` branch is merged
into `xpack`.

## License

The original content is released under the
[MIT License](https://opensource.org/licenses/MIT), with all rights reserved to
[Liviu Ionescu](https://github.com/ilg-ul).
