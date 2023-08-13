# Chinatown

## About

A theme for the ZSH shell that is decorated by a dragon and flames, using a powerline style.

Here is a preview that you can check out:

![](preview.png)

Note: the colors used in this shell theme will depend on your terminal emulator's theme. This means that it may look different in your setup compared to the preview. Theme used is [Flamerial](https://github.com/skippyr/flamerial).

In the prompt, you will find:

- If your last command failed, the dragon will spit fire.
- Your host and user names.
- If you have sourced a virtual environment, its base name.
- Your current directory path abbreviated in a Fish shell like way.
- If inside a Git repository, the branch name and the latest tag.

## Installation

### Dependencies

In order to install and run this software properly, the following dependencies must be installed:

- `git`: required to clone this repository and obtain information about your Git repositories to show in the prompt.
- [A Nerd Fonts' font](https://www.nerdfonts.com/font-downloads) and [an emojis font](https://fonts.google.com/noto/specimen/Noto+Emoji): required to provide the pretty symbols used in the prompt.

### Procedures

Using a command-line utility, follow these steps:

- Clone this repository using `git`.

```bash
git\
    clone --depth 1 https://github.com/skippyr/chinatown\
    ~/.local/share/zsh/themes/chinatown
```

- Add the following source rule in your `~/.zshrc` file. Ensure to not source any other theme to avoid causing conflicts.

```bash
source ~/.local/share/zsh/themes/chinatown/chinatown.zsh-theme
```

- Reopen your shell session. At this point, the theme should be installed and running.

## Support

Report issues, questions and suggestions through its [issues page](https://github.com/skippyr/chinatown/issues).

## Copyright

This software is under the MIT license. A copy of the license is bundled with the source code.
