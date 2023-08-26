# Chinatown
# About
This repository contains the source code of Chinatown, a theme for ZSH shell with a powerline style that is decorated by flames and a dragon.

![](preview.webp)

Note: this theme uses your terminal emulator's colors, so they may look different in your setup.

## Installation
### Dependencies
The following dependencies must be installed to install and run this theme.

- `ZSH`: this is the shell this theme applies on.
- `git`: it will be used to both clone this repository and to get info about your repositories to show in the prompt.
- [A Nerd Font's font](https://www.nerdfonts.com/font-downloads) and an [emojis font](https://fonts.google.com/noto/specimen/Noto+Emoji): they provide the pretty symbols used in the theme.

### Procedures
Using a terminal emulator, follow these steps:

- Clone this repository using `git`.

```bash
git clone --depth 1 https://github.com/skippyr/chinatown\
~/.local/share/zsh/themes/chinatown
```

- Add the following source command to your `~/.zshrc` file. Ensure to not source any other theme to avoid conflicts.

```bash
source ~/.local/share/zsh/themes/chinatown/chinatown.zsh-theme
```

- Open a new ZSH session. The theme should now be applied.

## Support
Report issues, questions and suggestions through its [issues page](https://github.com/skippyr/chinatown/issues).

## Copyright
This software is under the MIT license. A copy of the license is bundled with the source code.
