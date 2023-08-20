# Chinatown
## About
This repository contains the source code of Chinatown, a theme for the ZSH shell
that is decorated by a dragon and flames, using a powerline style.

Here is a preview that you can check it out:

![](preview.webp)

Please note that the colors used in the theme may look different in your setup,
as they depend on your terminal emulator's theme. The theme used in the preview
is [Flamerial](https://github.com/skippyr/flamerial).

In the prompt, you will find:
- If your last command failed, as the dragon will spit fire.
- Your host and user names.
- If you have sourced a virtual environment, its base name.
- Your current directory path, abbreviating parent directories by their
  initials.
- If inside a Git repository, the branch name and the latest tag.

## Installation
### Dependencies
In order to install and this software properly, the following dependencies
must be installed:

- `git`: required to both clone this repository and obtain information about
         your Git repositories to show in the prompt.
- [A Nerd Fonts' font](https://www.nerdfonts.com/font-downloads) and [an
  emojis font](https://fonts.google.com/noto/specimen/Noto+Emoji):
  required to provide the pretty symbols used in the prompt.

### Procedures
Using a command-line utility, follow these steps:

- Clone this repository using `git`.

  ```bash
  git clone --depth 1 https://github.com/skippyr/chinatown                     \
                      ~/.local/share/zsh/themes/chinatown
  ```

  The option `depth` with value `1` specifies to `git` that you only want to
  download the latest commit instead of the whole commit that it would do by
  default.

- Add the following source rule to your `~/.zshrc` file. Ensure to not be
  sourcing any other theme to avoid conflicts.

  ```bash
  source ~/.local/share/zsh/themes/chinatown/chinatown.zsh-theme
  ```

- Open a new ZSH session. At this point, the theme should be running and be
  ready for you to use.

## Support
Report issues, questions and suggestions through its [issues page](https://github.com/skippyr/chinatown/issues).

## Copyright
This software is under the MIT license. A copy of the license is bundled with
the source code.
