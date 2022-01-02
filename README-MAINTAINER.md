[![license](https://img.shields.io/github/license/micro-os-plus/devices-stm32f4-extras-xpack)](https://github.com/micro-os-plus/devices-stm32f4-extras-xpack/blob/xpack/LICENSE)
[![CI on Push](https://github.com/micro-os-plus/devices-stm32f4-extras-xpack/workflows/CI%20on%20Push/badge.svg)](https://github.com/micro-os-plus/devices-stm32f4-extras-xpack/actions?query=workflow%3A%22CI+on+Push%22)
[![GitHub issues](https://img.shields.io/github/issues/micro-os-plus/devices-stm32f4-extras-xpack.svg)](https://github.com/micro-os-plus/devices-stm32f4-extras-xpack/issues/)
[![GitHub pulls](https://img.shields.io/github/issues-pr/micro-os-plus/devices-stm32f4-extras-xpack.svg)](https://github.com/micro-os-plus/devices-stm32f4-extras-xpack/pulls)

# Maintainer info

## Project repository

The project is hosted on GitHub:

- <https://github.com/micro-os-plus/devices-stm32f4-extras-xpack.git>

To clone it:

```sh
git clone \
  https://github.com/micro-os-plus/devices-stm32f4-extras-xpack.git \
  devices-stm32f4-extras-xpack.git \
git -C devices-stm32f4-extras-xpack.git submodule update --init --recursive
```

For development purposes, clone the `xpack-develop` branch:

```sh
git clone \
  --branch xpack-develop \
  https://github.com/micro-os-plus/devices-stm32f4-extras-xpack.git \
  devices-stm32f4-extras-xpack.git \
git -C devices-stm32f4-extras-xpack.git submodule update --init --recursive
```

## Regenerate vectors_*.c

```sh
version=1.25.2
bash scripts/helper/generate-vectors-from-arm-startup.sh \
  ${HOME}/STM32Cube/Repository/STM32Cube_FW_F4_V${version}/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/arm \
  src/vectors
```

## Prerequisites

A recent [xpm](https://xpack.github.io/xpm/), which is a portable
[Node.js](https://nodejs.org/) command line application.

## Code formatting

Code formatting is done using `clang-format --style=file`, either manually
from a script, or automatically from Visual Studio Code, or the Eclipse
CppStyle plug-in.

## Prepare a new blog post

In the `micro-os-plus/web-jekyll` GitHub repo:

- select the `develop` branch
- add a new file to `_posts/devices-stm32f4-extras/releases`
- name the file like `2020-12-19-devices-stm32f4-v1-1-0-released.md`
- name the post like: **µOS++ devices-stm32f4 v2.0.3 released**
- update the `date:` field with the current date
- update the GitHub Actions URLs using the actual test pages

If any, refer to closed
[issues](https://github.com/micro-os-plus/devices-stm32f4-extras-xpack/issues/)
as:

- **[Issue:\[#1\]\(...\)]**.

## Publish on the npmjs.com server

- select the `xpack-develop` branch
- commit all changes
- update versions in `README.md` and `README-MAINTAINER.md`
- update `CHANGELOG.md`
- commit with a message like _prepare v2.0.3_
- `npm pack` and check the content of the archive, which should list
  only the `package.json`, the `README.md`, `LICENSE` and `CHANGELOG.md`;
  possibly adjust `.npmignore`
- `npm version patch`, `npm version minor`, `npm version major`
- push the `xpack-develop` branch to GitHub with `git push origin --tags`
- `npm publish --tag next` (use `--access public` when publishing for
  the first time)

The version is visible at:

- <https://www.npmjs.com/package/@micro-os-plus/devices-stm32f4-extras?activeTab=versions>

## Testing

The project includes unit tests.

To run them, run:

```sh
cd devices-stm32f4-extras-xpack.git
xpm run install-all
xpm run test
```

## Continuous Integration

All available tests are also performed on GitHub Actions, as the
[CI on Push](https://github.com/micro-os-plus/devices-stm32f4-extras-xpack/actions?query=workflow%3A%22CI+on+Push%22)
workflow.

## Update the repo

When the package is considered stable:

- with Sourcetree
- merge `xpack-develop` into `xpack`
- push to GitHub
- select `xpack-develop`

## Tag the npm package as `latest`

When the release is considered stable, promote it as `latest`:

- `npm dist-tag ls @micro-os-plus/devices-stm32f4-extras`
- `npm dist-tag add @micro-os-plus/devices-stm32f4-extras@2.0.3 latest`
- `npm dist-tag ls @@micro-os-plus/devices-stm32f4-extras`

## Announce to the community

Post an announcement to the forum.

## Share on Twitter

- in a separate browser windows, open [TweetDeck](https://tweetdeck.twitter.com/)
- using the `@micro_os_plus` account
- paste the release name like **µOS++ devices-stm32f4 v2.0.3 released**
- paste the link to the Web page release
- click the **Tweet** button
